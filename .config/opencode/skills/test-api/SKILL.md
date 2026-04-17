---
name: test-api
description: 'HTTP API testing for the current project using curl. Use when asked to test, call, hit, check, or verify API endpoints. Handles auth setup, port detection from .env, result evaluation, and guided retry flow.'
---

# HTTP API Testing

## When to Use
- Testing REST API endpoints of the currently open project
- Verifying request/response contracts during development
- Debugging endpoint behaviour against a local dev server
- Exploratory testing of create, read, update, delete flows

---

## Phase 1 — Detect Server Port

1. Look for a `.env` (or `.env.local`, `.env.development`) file at the project root.
2. Extract the port from variables like `PORT`, `APP_PORT`, `SERVER_PORT`, or any URL-shaped variable (`API_URL`, `BASE_URL`).
3. Derive the base URL: default to `http://localhost:<PORT>`.
4. **If no port can be determined**, ask the user directly:
   > "I couldn't find a port in your .env file. What URL is the server running on?"
5. Confirm the base URL with the user before proceeding.

---

## Phase 2 — Authentication Setup

1. Inspect the project (README, OpenAPI spec, source code) to determine the auth scheme:
   - **Bearer token** (Authorization: Bearer …)
   - **Basic auth** (username + password)
   - **API key** (header or query param)
   - **No auth**
2. For any authenticated endpoint, ask the user once per session:
   > "This API uses \<scheme\>. Please provide your credentials."
3. Store credentials in session memory and reuse them for all subsequent requests in this session. Never log raw secrets in output.
4. Build the appropriate curl auth flags:
   - Bearer: `-H "Authorization: Bearer $TOKEN"`
   - Basic: `-u "$USER:$PASS"`
   - API key: `-H "<KeyHeader>: $KEY"` or `?api_key=$KEY`

---

## Phase 3 — Constructing and Running Tests

### General curl template
```bash
curl -s -w "\n--- HTTP %{http_code} ---\n" \
  -X <METHOD> "<BASE_URL><PATH>" \
  -H "Content-Type: application/json" \
  [auth flags] \
  [-d '<JSON body>']
```

Always capture:
- HTTP status code (`-w "%{http_code}"`)
- Full response body (`-s` for silent progress)
- Response headers when debugging (`-i`)

### Resource-dependent endpoints (PUT / PATCH / DELETE)
When the endpoint requires an existing resource ID, key, or slug:
1. **Fetch** an existing resource first (`GET` the list or parent resource).
2. **If none exist**, create one with a `POST` — the server is a local dev environment and is your playground.
3. Use the retrieved/created ID for the target request.
4. Clean up (delete test data) only if explicitly requested by the user.

### Data creation for testing
You may freely `POST` test data to the local dev server/database. Prefix generated values clearly (e.g. `"name": "test-api-<timestamp>"`) so they are easy to identify and clean up later.

---

## Phase 4 — Evaluate and Report

After each curl call:

1. **Parse** the HTTP status code and body.
2. **Assess** against expectations:
   - 2xx → success; confirm response shape matches expected contract.
   - 3xx → note redirect target; follow manually if needed.
   - 4xx → client error; report exact error message and likely cause.
   - 5xx → server error; see error handling below.
3. **Report** results clearly:
   - Method + URL tested
   - Request body (sanitised — mask secrets)
   - Response status
   - Response body (pretty-printed JSON if applicable)
   - Assessment: PASS / FAIL / NEEDS INVESTIGATION + reason

---

## Phase 5 — Error Handling and Retry Policy

### Unrecoverable / external errors (DO NOT auto-retry)
If the response indicates:
- Database errors (connection refused, constraint violations, ORM stack traces)
- Third-party service failures (payment gateway, email, OAuth provider down)
- Internal server crashes (500 with stack trace pointing to infra/config)

**Action**: Report the error in full, then tell the user:
> "This looks like a \<database/third-party\> issue. Please check the server state and data, then let me know when you're ready and I can run the test again."

Wait for explicit confirmation before retrying.

### Recoverable / request-level errors (ask before retrying)
If the error might be resolved by adjusting the request (wrong payload shape, missing header, stale token, race condition):

1. Report the current result in full.
2. Describe what you think went wrong and what change you'd make.
3. Ask:
   > "Would you like me to retry with \<proposed change\>?"

**Never retry automatically.** Always wait for the user's go-ahead.

---

## Phase 6 — Involving the User

The user is your right hand. You can and should ask them to:
- Restart the server or a dependent service
- Seed or modify database records you cannot create via API
- Provide an admin token or elevated credentials for protected routes
- Check server logs for errors you cannot see
- Confirm expected response shapes when the spec is ambiguous

Frame asks clearly and concisely so the user knows exactly what action to take and can report back.

---

## Session State (to track internally)

| Item | Details |
|------|---------|
| `BASE_URL` | Detected or user-provided server URL |
| `AUTH_SCHEME` | Bearer / Basic / API key / None |
| `AUTH_CREDENTIALS` | Token or user:pass (keep in memory, never echo raw) |
| `LAST_CREATED_IDS` | IDs of any test resources created this session |

---

## Quick Reference — Common curl Flags

| Flag | Purpose |
|------|---------|
| `-s` | Silent (no progress bar) |
| `-i` | Include response headers |
| `-w "\n%{http_code}"` | Append status code after body |
| `-X POST` | Set HTTP method |
| `-H "..."` | Add request header |
| `-d '...'` | Set request body |
| `-u user:pass` | Basic auth |
| `--max-time 10` | Timeout after 10 s |
| `-v` | Verbose (full request + response trace for debugging) |
