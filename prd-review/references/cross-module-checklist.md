# Cross-Module Checklist

Use this checklist after module-level review. Many serious requirement defects only appear when modules are connected.

## Data Dependency

- Does every consumed object have a defined producer?
- Is object creation order clear?
- Are dependencies mandatory or optional?
- What happens if upstream data is absent?
- Which module is the source of truth?
- Are derived values recalculated, copied, or referenced?
- Are updates propagated to dependent modules?
- Are deletes, overrides, and imports reflected downstream?

## Identifier And Terminology Consistency

- Same field name means the same thing everywhere.
- Same object is not named differently across modules.
- Examples and placeholders do not conflict with real formats.
- IDs, codes, serial numbers, VINs, MACs, SEIDs, user IDs, task IDs, and batch IDs have clear uniqueness scope.

## Conflict Handling

Compare rules across create, edit, import, transfer, retry, and overwrite flows:

- What counts as a conflict?
- Is one matching field enough or must all identifiers match?
- What happens with zero, one, or multiple conflicts?
- Who can override?
- Does override create a new record or update an existing record?
- Is the old value retained for audit?
- Are downstream bindings updated?

## State And Lifecycle

- Are state names shared across modules?
- Are transition triggers explicit?
- Are invalid transitions blocked?
- Are terminal states defined?
- Are retries and cancellations possible?
- Are partial success states handled?
- Are failed sub-tasks recoverable?

## Permission And Entry Points

- Is the same operation available through multiple pages, APIs, imports, or background jobs?
- Do all entry points enforce the same permission and validation rules?
- Are admin-only operations clearly marked?
- Is sensitive data masked or restricted?
- Are audit logs required for privileged operations?

## External Systems

- Which external system receives data?
- Is the call synchronous or asynchronous?
- What happens on timeout or failure?
- Is retry automatic or manual?
- Is idempotency required?
- How is the user informed?
- How is reconciliation performed?

## Testing Across Modules

- Can QA create realistic end-to-end data?
- Are upstream preconditions documented?
- Are negative scenarios testable?
- Can data cleanup or rollback be performed?
- Are integration success/failure signals observable?

