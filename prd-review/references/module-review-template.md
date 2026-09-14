# Module Review Template

Use this template for each functional module that matters to the requirement.

## Module Summary

| Field | Notes |
|-------|-------|
| Module name | Name from document |
| Responsibility | What the module owns |
| Actors | Who uses or operates it |
| Business objects | Objects created, viewed, updated, deleted, imported, exported |
| Inputs | User input, upstream data, external system data |
| Outputs | Records, state changes, tasks, notifications, external calls |
| Dependencies | Modules, services, reference data, configuration |
| Downstream effects | What other modules or systems are affected |

## Internal Rule Checks

Check:

- Create/edit/delete/view rules
- Required fields and validation
- Identifier uniqueness
- Status changes
- Search/filter rules
- Conflict detection
- Permission constraints
- Bulk operations
- Error handling and user prompts
- Audit requirements
- Data retention or history

## Review Questions

- Is the module's boundary clear?
- Does the module own the data it modifies?
- Are all actions available only to allowed roles?
- Are validation rules complete and consistent?
- Are all branches of each decision described?
- Are failures and retries specified?
- Are user messages specified where behavior depends on them?
- Can QA write deterministic tests from the description?

## Module Finding Output

For each module, output:

1. Understanding of the module.
2. Key rules extracted from the document.
3. Problems found.
4. Missing decisions.
5. Recommended changes.
6. Suggested test scenarios.

