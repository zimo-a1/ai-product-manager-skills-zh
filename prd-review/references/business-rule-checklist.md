# Business Rule Checklist

Use this to evaluate individual rules.

## Rule Anatomy

A complete business rule usually includes:

| Part | Question |
|------|----------|
| Trigger | When does the rule run? |
| Actor | Who or what initiates it? |
| Preconditions | What must already be true? |
| Inputs | What data is needed? |
| Validation | What makes input valid or invalid? |
| Success behavior | What changes after success? |
| Failure behavior | What happens when validation or execution fails? |
| User feedback | What message or state does the user see? |
| Side effects | What other records, modules, or systems are affected? |
| Audit | What must be logged? |
| Repeat behavior | What if the same operation is repeated? |
| Concurrency | What if two users/jobs operate at the same time? |
| Boundary | Min/max, empty, duplicate, expired, locked, missing, partial cases |
| Test oracle | How can QA verify it passed or failed correctly? |

## Common Missing Rule Areas

### Validation

- Required fields
- Format
- Length
- Allowed characters
- Uniqueness
- Reference data validity
- Cross-field dependency
- Time validity

### Permissions

- View
- Create
- Edit
- Delete
- Export/download
- Import
- Override
- Retry
- Reset/unbind
- Approve
- Configure

### Error Handling

- Empty result
- Duplicate data
- Multiple conflicts
- External API failure
- Timeout
- Partial success
- Invalid state
- Expired token/code
- Locked account
- Insufficient permission

### Data Integrity

- Source of truth
- Transaction boundary
- Atomicity
- Idempotency
- Rollback
- Compensation
- History retention
- Audit log
- Reconciliation

### Security

- Authentication
- Authorization
- Sensitive operation re-authentication
- Lockout
- Rate limit
- Anti-enumeration
- Data masking
- Least privilege
- Admin override audit

## Suggested Acceptance Criteria Pattern

For important rules, suggest testable acceptance criteria:

```text
Given [precondition]
When [actor/action/input]
Then [expected system behavior]
And [data/state/side effect]
And [user-visible feedback]
```

For data operations, include:

```text
- Existing data condition
- Operation
- Expected record change
- Expected conflict behavior
- Expected audit/history
- Expected downstream effect
```

