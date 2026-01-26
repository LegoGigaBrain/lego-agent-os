# Skill: Vibe-Coding Security

## Purpose

Prevent the 10 critical security vulnerabilities commonly found in AI-generated code and BaaS (Backend-as-a-Service) applications.

Apply this skill when:
- Writing code for Supabase, Firebase, or similar BaaS
- Reviewing AI-generated code
- Building apps with direct database access patterns
- Implementing payment/webhook integrations
- Creating storage upload features

## Reference

See: `standards/security/vibe-coding-security.md` for comprehensive documentation.

---

## The 10-Point Security Checklist

Before generating or approving code, verify:

### 1. Backend-First Architecture
- [ ] No `supabase.from()` or `firebase.firestore()` in client/frontend code
- [ ] All mutations go through Server Actions, Edge Functions, or API Routes
- [ ] Business logic is server-side only

### 2. RLS Configuration (Zero-Policy Rule)
- [ ] RLS enabled on all tables
- [ ] No overly permissive UPDATE/INSERT policies
- [ ] Database accessed via service_role in server code only

### 3. Column Protection
- [ ] Sensitive columns (role, permissions, subscription) never client-updateable
- [ ] Server-side whitelist of allowed update fields

### 4. Rate Limiting
- [ ] Rate limits on auth endpoints (login, signup, password reset)
- [ ] Rate limits on mutation endpoints
- [ ] Rate limits on webhook handlers

### 5. Storage Security
- [ ] No public buckets for user data
- [ ] UUID filenames (not sequential/predictable)
- [ ] Signed URLs with expiry for file access

### 6. Webhook Verification
- [ ] Cryptographic signature verification on ALL webhooks
- [ ] Webhook secrets in environment variables
- [ ] Idempotency handling for duplicate events

### 7. RPC Lockdown
- [ ] `REVOKE EXECUTE FROM public` on all custom functions
- [ ] Only service_role granted execute permissions

### 8. Environment Hygiene
- [ ] `.env` in `.gitignore`
- [ ] No hardcoded secrets
- [ ] Environment variables validated at startup

### 9. Anon Key Protection
- [ ] Anon key only used for auth flows (if needed)
- [ ] No sensitive operations possible with anon key

### 10. Mobile Safety
- [ ] Zero business logic in mobile client code
- [ ] Pricing/payment logic 100% server-side

---

## Code Patterns

### NEVER Generate (Anti-patterns)

```typescript
// NEVER - Direct DB access from client
const { data } = await supabase.from('users').select('*')
await supabase.from('orders').insert({ ... })

// NEVER - Trusting webhook payload without verification
if (req.body.type === 'payment_success') { giveAccess() }

// NEVER - Public storage with predictable names
await storage.upload(`avatar_${userId}.jpg`, file)

// NEVER - Hardcoded secrets
const client = createClient(url, 'sk_live_xxx...')

// NEVER - Overly permissive RLS
CREATE POLICY "Users can update own row" ON users FOR UPDATE USING (auth.uid() = id);
```

### ALWAYS Generate (Secure patterns)

```typescript
// ALWAYS - Server Action for mutations
'use server'
export async function updateProfile(data: FormData) {
  const user = await getAuthenticatedUser()
  const validated = schema.parse(Object.fromEntries(data))
  // ... server-side logic
}

// ALWAYS - Verify webhook signatures
const event = stripe.webhooks.constructEvent(body, sig, secret)

// ALWAYS - UUID filenames + signed URLs
const path = `${userId}/${randomUUID()}.jpg`
await storage.upload(path, file)
const url = await storage.createSignedUrl(path, 3600)

// ALWAYS - Environment variables
const client = createClient(process.env.SUPABASE_URL!, process.env.SUPABASE_SERVICE_KEY!)

// ALWAYS - Lock down RPC functions
REVOKE EXECUTE ON FUNCTION my_function FROM public;
GRANT EXECUTE ON FUNCTION my_function TO service_role;
```

---

## Decision Tree

```
Is this code accessing a database?
├── Yes
│   └── Is it running on the server (Server Action/Edge Function/API Route)?
│       ├── Yes → OK, but verify auth and input validation
│       └── No → REJECT - Move to server-side
│
Is this code handling a webhook?
├── Yes
│   └── Does it verify the signature before processing?
│       ├── Yes → OK
│       └── No → REJECT - Add signature verification
│
Is this code uploading files?
├── Yes
│   └── Is the bucket private AND using UUID filenames?
│       ├── Yes → OK
│       └── No → REJECT - Fix storage configuration
│
Is this creating a Postgres function?
├── Yes
│   └── Does it REVOKE public access immediately after?
│       ├── Yes → OK
│       └── No → REJECT - Add REVOKE statements
```

---

## Handoffs

| Situation | Action |
|-----------|--------|
| Complex RLS policy design | Escalate to `@security-auditor` |
| Payment integration security | Escalate to `@security-auditor` |
| Infrastructure/deployment security | Escalate to `@senior-architect` |
| Smart contract + BaaS integration | Escalate to `@security-auditor` + `@solidity-protocol-engineer` |

---

## Related Skills

- `skill-secure-coding-standards` - General secure coding practices
- `skill-backend-api-standards` - API design with security
- `skill-smart-contract-audit-checklist` - For web3 integrations

---

## Quick Commands

- `/vibe-security-audit` - Full audit of BaaS codebase
- `/security-review` - General security review (includes vibe-coding checks)
