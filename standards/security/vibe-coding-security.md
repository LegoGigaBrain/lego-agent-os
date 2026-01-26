# Vibe-Coding Security Standards

Security standards for AI-generated code and Backend-as-a-Service (BaaS) applications.

These standards address the 10 critical vulnerabilities found in "vibe-coded" apps that have exposed 600,000+ users' personal data.

---

## Core Principle: Backend-First Architecture

**The frontend is a VIEW LAYER only. It speaks to APIs, not databases.**

When using Supabase, Firebase, or similar BaaS:
- Enable RLS on all tables but add NO public policies (acts as "Deny All")
- Database is only accessible via `service_role` key in Edge Functions/Server Actions
- All business logic, validation, rate limiting, and column filtering happens server-side

---

## 1. Direct-to-DB Access (The "Magic" Trap)

### The Vulnerability

AI tools love writing direct database queries from the frontend:

```typescript
// DANGEROUS - Never do this
supabase.from('users').update({ is_pro: true }).eq('id', user.id)
```

A hacker can open their browser console and run:

```typescript
// Attacker's console
supabase.from('users').update({ is_admin: true })
```

### The Fix

**NEVER** query the database directly from client code. Use server-side functions:

```typescript
// SECURE - Server Action (Next.js)
'use server'

import { createClient } from '@/lib/supabase/server'

export async function upgradeToPro(userId: string) {
  const supabase = createClient()

  // Verify the user is authenticated and authorized
  const { data: { user } } = await supabase.auth.getUser()
  if (!user || user.id !== userId) {
    throw new Error('Unauthorized')
  }

  // Verify payment was actually made (check your payment provider)
  const paymentVerified = await verifyPayment(userId)
  if (!paymentVerified) {
    throw new Error('Payment not verified')
  }

  // Now safe to update
  const { error } = await supabase
    .from('users')
    .update({ is_pro: true })
    .eq('id', userId)

  if (error) throw error
}
```

### Checklist

- [ ] No `supabase.from()` or `firebase.firestore()` calls in client/frontend code
- [ ] All data mutations go through Server Actions or Edge Functions
- [ ] All data reads that require authorization go through server-side functions
- [ ] Service role key is ONLY used in server-side environment variables

---

## 2. Row-Level Security (RLS) Configuration

### The Vulnerability

Default RLS policies are often too permissive:

```sql
-- DANGEROUS - Allows users to update ANY column in their row
CREATE POLICY "Users can update own row"
ON users FOR UPDATE
USING (auth.uid() = id);
```

This lets users inject fields: `{ role: 'admin', subscription_status: 'active' }`

### The Fix: Zero-Policy Rule

Enable RLS but create NO public policies. Let server-side code (with service_role) handle all access:

```sql
-- SECURE - Enable RLS with no policies
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- No policies = no public access
-- All access goes through service_role in Edge Functions
```

If you must have RLS policies, restrict columns explicitly:

```sql
-- SECURE - Column-restricted policy
CREATE POLICY "Users can update own profile fields only"
ON users FOR UPDATE
USING (auth.uid() = id)
WITH CHECK (
  -- Only allow specific columns to be updated
  -- This requires application-level enforcement
  auth.uid() = id
);
```

### Server-Side Column Filtering

```typescript
// SECURE - Whitelist allowed fields
export async function updateProfile(userId: string, data: unknown) {
  const ALLOWED_FIELDS = ['display_name', 'avatar_url', 'bio']

  const validated = z.object({
    display_name: z.string().max(50).optional(),
    avatar_url: z.string().url().optional(),
    bio: z.string().max(500).optional(),
  }).parse(data)

  // Only the whitelisted fields can be updated
  const { error } = await supabaseAdmin
    .from('users')
    .update(validated)
    .eq('id', userId)
}
```

### Checklist

- [ ] RLS is enabled on ALL tables
- [ ] No overly permissive policies (especially for UPDATE/INSERT)
- [ ] Column updates are whitelisted in server-side code
- [ ] Sensitive columns (role, permissions, subscription) are NEVER client-updateable

---

## 3. Rate Limiting

### The Vulnerability

Without rate limiting, attackers can:
- Insert millions of rows (bloat your database)
- Brute force magic links or OTPs
- Enumerate user IDs or emails
- Drain your API quotas
- DDoS your wallet via payment provider calls

### The Fix

Apply rate limits at multiple layers:

```typescript
// Using Upstash Rate Limit
import { Ratelimit } from '@upstash/ratelimit'
import { Redis } from '@upstash/redis'

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(10, '1 m'), // 10 requests per minute
})

export async function createTodo(userId: string, data: unknown) {
  // Rate limit by user
  const { success, limit, remaining } = await ratelimit.limit(userId)

  if (!success) {
    throw new Error('Rate limit exceeded. Try again later.')
  }

  // Proceed with creation...
}
```

### Rate Limit Recommendations

| Endpoint Type | Limit | Window |
|--------------|-------|--------|
| Auth (login/signup) | 5 | 15 min |
| Magic link request | 3 | 1 hour |
| Password reset | 3 | 1 hour |
| Data mutations | 30 | 1 min |
| File uploads | 10 | 1 min |
| Webhooks | 100 | 1 min |
| Read operations | 100 | 1 min |

### Checklist

- [ ] Rate limiting on all auth endpoints
- [ ] Rate limiting on all mutation endpoints
- [ ] Rate limiting on webhook handlers
- [ ] Rate limiting on file uploads
- [ ] User-specific limits (not just IP-based)

---

## 4. Storage Security

### The Vulnerability

AI often creates public storage buckets with predictable names:

```typescript
// DANGEROUS
const bucket = supabase.storage.from('avatars')
await bucket.upload(`avatar_${userId}.jpg`, file)
// Anyone can guess: /avatars/avatar_1.jpg, avatar_2.jpg, etc.
```

This allows enumeration attacks. Sensitive files (ID cards, invoices) get exposed.

### The Fix

1. **Never use public buckets for user data**
2. **Use UUIDs for filenames**
3. **Use signed URLs for access**

```typescript
// SECURE - Server-side upload handler
import { randomUUID } from 'crypto'

export async function uploadAvatar(userId: string, file: File) {
  const supabase = createServerClient()

  // Generate unpredictable filename
  const filename = `${randomUUID()}.${getExtension(file.name)}`
  const path = `${userId}/${filename}`

  // Upload to PRIVATE bucket
  const { error } = await supabase.storage
    .from('private-avatars') // Private bucket
    .upload(path, file)

  if (error) throw error

  // Store the path, not a public URL
  await supabase
    .from('users')
    .update({ avatar_path: path })
    .eq('id', userId)
}

// SECURE - Generate signed URL when needed
export async function getAvatarUrl(userId: string, avatarPath: string) {
  const supabase = createServerClient()

  // Verify user can access this avatar
  // ... authorization check ...

  const { data, error } = await supabase.storage
    .from('private-avatars')
    .createSignedUrl(avatarPath, 3600) // 1 hour expiry

  return data?.signedUrl
}
```

### Checklist

- [ ] No public buckets for sensitive user data
- [ ] All filenames use UUIDs (not sequential or predictable)
- [ ] Signed URLs used for file access
- [ ] URL expiry is reasonable (1 hour or less for sensitive files)
- [ ] Server-side authorization before generating signed URLs

---

## 5. Webhook Security

### The Vulnerability

AI often forgets to verify webhook signatures:

```typescript
// DANGEROUS - Trusts any request
export async function POST(req: Request) {
  const body = await req.json()

  if (body.type === 'payment_success') {
    await giveAccess(body.userId) // Attacker sends fake webhook
  }
}
```

### The Fix

Always verify cryptographic signatures:

```typescript
// SECURE - Stripe webhook verification
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!)

export async function POST(req: Request) {
  const body = await req.text()
  const signature = req.headers.get('stripe-signature')!

  let event: Stripe.Event

  try {
    // Verify signature - this is CRITICAL
    event = stripe.webhooks.constructEvent(
      body,
      signature,
      process.env.STRIPE_WEBHOOK_SECRET!
    )
  } catch (err) {
    console.error('Webhook signature verification failed')
    return new Response('Invalid signature', { status: 400 })
  }

  // Now safe to process
  if (event.type === 'checkout.session.completed') {
    const session = event.data.object as Stripe.Checkout.Session
    await giveAccess(session.client_reference_id!)
  }

  return new Response('OK')
}
```

### Additional Webhook Security

```typescript
// Use randomized webhook URLs
// Instead of: /api/webhooks/stripe
// Use: /api/webhooks/stripe-a8f3k2m9x1 (random suffix)

// Implement idempotency
const processed = await redis.get(`webhook:${event.id}`)
if (processed) {
  return new Response('Already processed')
}
await redis.set(`webhook:${event.id}`, '1', 'EX', 86400) // 24h expiry
```

### Checklist

- [ ] All webhooks verify cryptographic signatures
- [ ] Webhook secrets stored in environment variables
- [ ] Idempotency handling for duplicate events
- [ ] Webhook URLs use random suffixes
- [ ] Failed verification returns 400 immediately

---

## 6. RPC Function Lockdown

### The Vulnerability

Postgres functions are executable by public by default:

```sql
-- DANGEROUS - Anyone can call this
CREATE FUNCTION add_credits(user_id UUID, amount INT)
RETURNS VOID AS $$
BEGIN
  UPDATE users SET credits = credits + amount WHERE id = user_id;
END;
$$ LANGUAGE plpgsql;

-- Attacker calls: SELECT add_credits('my-id', 1000000);
```

### The Fix

Revoke public access immediately after creation:

```sql
-- SECURE - Lock down the function
CREATE FUNCTION add_credits(user_id UUID, amount INT)
RETURNS VOID AS $$
BEGIN
  UPDATE users SET credits = credits + amount WHERE id = user_id;
END;
$$ LANGUAGE plpgsql;

-- Immediately revoke public access
REVOKE EXECUTE ON FUNCTION add_credits FROM public;
REVOKE EXECUTE ON FUNCTION add_credits FROM anon;
REVOKE EXECUTE ON FUNCTION add_credits FROM authenticated;

-- Only service_role can call it
GRANT EXECUTE ON FUNCTION add_credits TO service_role;
```

### Checklist

- [ ] All custom functions have public access revoked
- [ ] Only service_role granted execute permissions
- [ ] Functions are called from server-side code only
- [ ] Audit existing functions for public access

---

## 7. Environment Variable Hygiene

### The Vulnerability

Service keys committed to git are immediately compromised. Bots scan GitHub in real-time.

```typescript
// DANGEROUS - Hardcoded key
const supabase = createClient(
  'https://xxx.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...' // Service role key exposed!
)
```

### The Fix

1. **Add `.env` to `.gitignore` BEFORE writing any code**
2. **Use `.env.local` for development**
3. **Validate env vars at build time**

```typescript
// SECURE - Environment validation (e.g., with Zod)
import { z } from 'zod'

const envSchema = z.object({
  SUPABASE_URL: z.string().url(),
  SUPABASE_ANON_KEY: z.string().min(1),
  SUPABASE_SERVICE_ROLE_KEY: z.string().min(1),
  STRIPE_SECRET_KEY: z.string().startsWith('sk_'),
  STRIPE_WEBHOOK_SECRET: z.string().startsWith('whsec_'),
})

export const env = envSchema.parse(process.env)
```

### .gitignore Template

```gitignore
# Environment variables - NEVER COMMIT
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
.env*.local

# Keys and secrets
*.pem
*.key
secrets/
```

### Checklist

- [ ] `.env` in `.gitignore` from project start
- [ ] No hardcoded secrets in any file
- [ ] Environment variables validated at startup
- [ ] Different keys for dev/staging/production
- [ ] Keys rotated if ever exposed

---

## 8. The Anon Key Myth

### The Vulnerability

Many developers think the anon key is safe. It's not.

The anon key exposes your entire database schema via the REST API. Attackers can map every table and column.

### The Fix

If using backend-first architecture, disable the public REST API entirely:

```sql
-- In Supabase SQL Editor
-- Revoke anon access to the REST API
REVOKE USAGE ON SCHEMA public FROM anon;
```

Or configure PostgREST to not expose tables:

```sql
-- Hide all tables from the REST API
ALTER TABLE users SET (security_invoker = true);
```

### Checklist

- [ ] Anon key only used for authentication flows (if needed)
- [ ] No sensitive operations possible with anon key
- [ ] Consider disabling public REST API entirely
- [ ] Schema exposure audited

---

## 9. Mobile Architecture Considerations

### The Vulnerability

You cannot hot-fix a mobile app. Frontend business logic bugs take days to fix:

1. Fix the code
2. Submit to app store
3. Wait 24-48 hours for review
4. Wait weeks for users to update

A pricing bug or security vulnerability bleeds money the entire time.

### The Fix

**ALL business logic must be server-side for mobile apps.**

```typescript
// Mobile app only calls APIs
const response = await fetch('/api/purchase', {
  method: 'POST',
  body: JSON.stringify({ productId, userId }),
})

// Server handles ALL logic
// - Price calculation
// - Inventory check
// - Payment processing
// - Access granting
```

### Checklist

- [ ] Zero business logic in mobile client code
- [ ] Pricing/payment logic is 100% server-side
- [ ] Feature flags controlled server-side
- [ ] Can disable features without app update

---

## 10. Compliance Checklist

Before deploying any BaaS application:

### Database

- [ ] RLS enabled on all tables
- [ ] No overly permissive RLS policies
- [ ] Sensitive columns protected from client updates
- [ ] All RPC functions locked down (public revoked)

### API Layer

- [ ] All mutations go through server-side code
- [ ] Rate limiting on all endpoints
- [ ] Input validation with Zod or similar
- [ ] Error messages don't leak sensitive info

### Authentication

- [ ] Auth state managed server-side
- [ ] Session tokens are httpOnly cookies (not localStorage)
- [ ] Password reset rate limited
- [ ] Magic link rate limited

### Storage

- [ ] No public buckets for user data
- [ ] UUID filenames (not sequential)
- [ ] Signed URLs with reasonable expiry
- [ ] Server-side authorization for file access

### Webhooks

- [ ] All webhooks verify signatures
- [ ] Idempotency handling
- [ ] Randomized webhook URLs
- [ ] Webhook secrets in env vars

### Environment

- [ ] `.env` in `.gitignore`
- [ ] No hardcoded secrets
- [ ] Env vars validated at build
- [ ] Different keys per environment

### Monitoring

- [ ] Failed auth attempts logged
- [ ] Rate limit hits logged
- [ ] Webhook failures alerted
- [ ] Unusual database activity monitored

---

## Quick Reference

| Vulnerability | Fix |
|--------------|-----|
| Direct-to-DB | Use Server Actions/Edge Functions only |
| Weak RLS | Zero-Policy Rule (no public policies) |
| No rate limits | Upstash/Redis rate limiting on all mutations |
| Public storage | Private buckets + signed URLs + UUIDs |
| Unverified webhooks | Always verify signatures |
| Public RPCs | REVOKE EXECUTE FROM public |
| Leaked secrets | .env in .gitignore + validation |
| Mobile logic | 100% server-side business logic |

---

## Related Resources

- `/vibe-security-audit` - Dedicated audit command for BaaS apps
- `@security-auditor` - Escalate complex security concerns
- `standards/security/secure-coding.md` - General secure coding practices
