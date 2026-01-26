# Skill: Playwright Browser Automation

## Purpose

Leverage Playwright's MCP server for browser automation, interactive scraping, and UI testing. This skill enables agents to interact with web pages as a user would — clicking, typing, navigating, and capturing screenshots.

---

## Core Philosophy

**See the web as users see it.** Playwright provides real browser automation, handling JavaScript rendering, authentication, and dynamic content that static scrapers can't reach.

---

## MCP Tools Available

### 1. Navigate (`playwright_navigate`)

Navigate to a URL in the browser.

**Use When:**
- Opening a new page
- Starting a workflow
- Navigating between pages

**Parameters:**
```
url: "https://example.com"
```

---

### 2. Click (`playwright_click`)

Click on an element using accessibility tree.

**Use When:**
- Clicking buttons
- Opening menus
- Selecting options
- Following links

**Parameters:**
```
selector: "button:has-text('Sign In')"
// or
ref: "element_ref_from_snapshot"
```

---

### 3. Fill (`playwright_fill`)

Fill in form fields.

**Use When:**
- Entering text in inputs
- Filling forms
- Search boxes

**Parameters:**
```
selector: "input[name='email']"
value: "text to enter"
```

---

### 4. Screenshot (`playwright_screenshot`)

Capture page screenshot.

**Use When:**
- Documenting state
- Capturing evidence
- Visual verification
- Competitor analysis

**Parameters:**
```
path: "screenshot.png"  // optional
full_page: true  // optional
```

---

### 5. Get Text (`playwright_get_text`)

Extract text content from page or element.

**Use When:**
- Reading page content
- Extracting data
- Verification

**Parameters:**
```
selector: ".content"  // optional, defaults to full page
```

---

### 6. Get Snapshot (`playwright_snapshot`)

Get accessibility tree snapshot of page.

**Use When:**
- Understanding page structure
- Finding element references
- Accessibility analysis

**Returns:**
- Structured accessibility tree
- Element references for interaction

---

## Automation Patterns

### Login Flow

```
1. Navigate to login:
   playwright_navigate: "https://app.example.com/login"

2. Fill credentials:
   playwright_fill: selector="input[name='email']", value="user@example.com"
   playwright_fill: selector="input[name='password']", value="password"

3. Submit:
   playwright_click: "button[type='submit']"

4. Verify:
   playwright_get_text: ".welcome-message"
```

### Dashboard Scraping (Authenticated)

```
1. Login (as above)

2. Navigate to dashboard:
   playwright_navigate: "https://app.example.com/dashboard"

3. Wait for data:
   playwright_snapshot  // verify content loaded

4. Capture:
   playwright_screenshot: path="dashboard.png", full_page=true

5. Extract:
   playwright_get_text: ".metrics-panel"
```

### Multi-Page Navigation

```
1. Start:
   playwright_navigate: "https://example.com"

2. Click through:
   playwright_click: "a:has-text('Products')"
   playwright_click: ".product-card:first"

3. Extract:
   playwright_get_text: ".product-details"
```

### Form Submission

```
1. Navigate to form:
   playwright_navigate: "https://example.com/contact"

2. Fill fields:
   playwright_fill: "#name", "John Doe"
   playwright_fill: "#email", "john@example.com"
   playwright_fill: "#message", "Hello world"

3. Submit:
   playwright_click: "button:has-text('Send')"

4. Verify:
   playwright_get_text: ".success-message"
```

---

## Selector Strategies

### By Text (Preferred)
```
button:has-text('Submit')
a:has-text('Learn More')
```

### By Role
```
role=button[name='Submit']
role=link[name='Home']
```

### By CSS
```
.class-name
#id-name
[data-testid='element']
```

### By Attribute
```
input[name='email']
button[type='submit']
```

### Combining
```
.form-container button:has-text('Submit')
#login-form input[name='password']
```

---

## Snapshot Mode vs Vision Mode

### Snapshot Mode (Default)
- Uses accessibility tree
- Fast and reliable
- Works for most interactions
- Preferred approach

### Vision Mode (Fallback)
- Uses visual coordinates
- For elements not in accessibility tree
- Slower but handles edge cases
- Use when snapshot fails

---

## Authentication Handling

### Manual Login (Recommended)
```
1. Navigate to login page
2. User enters credentials manually
3. Continue automation after login
4. Cookies persist for session
```

### Stored Session
```
1. Login once
2. Save session/cookies
3. Restore for future runs
4. Handle session expiry
```

---

## Output Formatting

### Automation Report Template

```
## Automation: [Task]

### Steps Executed

1. ✅ Navigate to [URL]
2. ✅ Click [element]
3. ✅ Fill [form]
4. ✅ Submit
5. ✅ Verify result

### Screenshots
- [screenshot1.png] - Initial state
- [screenshot2.png] - After action

### Extracted Data
[Data extracted from pages]

### Notes
[Any issues or observations]
```

### Scraping Result Template

```
## Scraped: [Site] (Authenticated)

### Access Method
[How authentication was handled]

### Data Extracted

**Section 1:**
[Content]

**Section 2:**
[Content]

### Screenshots
[References to captured screenshots]
```

---

## Integration with Agents

### research-analyst
- Authenticated dashboard scraping
- Interactive site research
- Data extraction from web apps

### security-auditor
- Security testing
- Form vulnerability checks
- Authentication flow testing

### vibe-marketer
- Competitor dashboard screenshots
- Social proof capture
- Landing page screenshots

---

## Use Cases

### Competitive Intelligence
- Screenshot competitor dashboards
- Capture pricing page states
- Document feature comparisons

### Quality Assurance
- Verify user flows work
- Test form submissions
- Check responsive behavior

### Data Collection
- Scrape authenticated content
- Extract dashboard data
- Capture dynamic content

### Documentation
- Screenshot product states
- Capture before/after
- Document UI flows

---

## Quality Checklist

Before automation:

- [ ] URL is accessible
- [ ] Selectors are reliable
- [ ] Authentication is handled
- [ ] Steps are in correct order
- [ ] Verification points included

---

## Anti-Patterns

1. **Fragile selectors** — Use text/role over CSS when possible
2. **No verification** — Always verify actions succeeded
3. **Hardcoded waits** — Use smart waits for dynamic content
4. **No error handling** — Handle element not found
5. **Credential exposure** — Never log passwords

---

## Troubleshooting

### "Element not found"
- Check selector is correct
- Wait for page to load
- Verify element is visible
- Use snapshot to find correct ref

### "Click not working"
- Element may be covered
- Try different selector
- Check if modal is blocking
- Verify element is clickable

### "Page not loading"
- Check URL is correct
- Verify network connectivity
- Look for JavaScript errors
- Check if site blocks automation

---

## Security Notes

1. **Never automate malicious actions**
2. **Respect rate limits**
3. **Don't bypass security measures**
4. **Handle credentials securely**
5. **Get permission for authenticated access**
