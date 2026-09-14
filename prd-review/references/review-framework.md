# Deep Requirement Review Framework

## Review Philosophy

The review starts by reconstructing the business system described by the requirement. A requirement can be formally complete but still wrong, contradictory, impossible to implement, or impossible to test. The reviewer should look for those deeper risks.

The core question is:

> Can a product owner, engineer, tester, and stakeholder reach the same understanding from this document and build the intended behavior without hidden assumptions?

## Business Model To Extract

Build a concise model before writing findings.

| Model Area | What To Identify |
|------------|------------------|
| Business goal | Why the system or feature exists, what outcome it should enable |
| Scope | Included capabilities, excluded capabilities, assumptions |
| Actors | Human users, admins, operators, external systems, scheduled jobs |
| Business objects | Core entities, identifiers, lifecycle, ownership, uniqueness |
| Modules | Functional areas, responsibilities, boundaries |
| Data relationships | Parent/child, dependency, derivation, synchronization, ownership |
| Workflows | Main paths, branch points, retries, failure paths, completion criteria |
| States | Entity statuses, transition triggers, terminal states, invalid transitions |
| Permissions | Who can view, create, update, delete, approve, override, export |
| Side effects | Notifications, logs, external calls, data propagation, cache invalidation |
| Audit and recovery | Traceability, history, rollback, compensation, manual repair |

For each important model statement, label it:

- **Stated**: directly present in the document.
- **Inferred**: plausible from context but not explicit.
- **Missing**: necessary but absent.
- **Question**: cannot be determined and needs a decision.

## Review Passes

### 1. Structural Pass

Check whether the document contains enough material to understand the product:

- Background and objective
- Scope and non-scope
- Module descriptions
- Workflows
- Business rules
- Data rules
- Permissions
- Exception handling
- Acceptance criteria

This pass is not the final review. It only reveals whether deeper review has enough input.

### 2. Module Pass

Review each module in isolation:

- What problem does the module solve?
- What inputs does it require?
- What outputs or side effects does it produce?
- Which objects does it own?
- Which other modules does it depend on?
- What rules govern create/read/update/delete actions?
- Which actors can operate it?
- Which exceptions are possible?
- How can success/failure be verified?

### 3. Cross-Module Pass

Review module interactions:

- Does every downstream dependency have an upstream producer?
- Are names and identifiers used consistently?
- Do conflict and overwrite rules match across modules?
- Do states transition coherently across modules?
- Are side effects and propagation rules explicit?
- Can a user enter the same operation through multiple paths with different outcomes?
- Are permissions enforced consistently across all entry points?

### 4. Requirement Clarity And Consistency Pass

Review whether the requirement can be interpreted consistently by product, design, engineering, QA, and stakeholders:

- Are business rules clearly defined rather than implied?
- Are terms used consistently across sections?
- Are feature descriptions consistent across overview, flow, UI, rules, and acceptance criteria?
- Are data definitions unified across modules?
- Are priority labels and priority criteria defined and used consistently?
- Are there mutually contradictory requirements?
- Is each requirement unambiguous enough for design, development, and testing?

Use `requirement-quality-checklist.md` for detailed checks.

### 5. Rule Completeness Pass

Evaluate individual business rules:

- Trigger condition
- Preconditions
- Happy path action
- Failure branches
- Boundary conditions
- Idempotency
- Concurrency behavior
- Data persistence
- Audit logging
- User-facing feedback
- Testability

### 6. Risk Pass

Identify risks that can cause wrong implementation, production defects, or project delay:

- Ambiguous requirements
- Missing product decisions
- Conflicting business logic
- Data corruption or inconsistency
- Security and permission holes
- External dependency assumptions
- Migration or compatibility gaps
- Missing observability/audit
- Untestable acceptance criteria

## Evidence Standard

Each important finding should cite evidence from the document:

- Section title
- Line number, if available
- Table row or field name
- Short phrase from the source
- Screenshot/diagram reference, if text is not available

Avoid long quotations. Use short phrases only as anchors.

## Recommended Review Depth

For a long document, prioritize:

1. Core business flows
2. Data ownership and dependencies
3. Permission and security boundaries
4. Conflict, overwrite, retry, rollback, and deletion rules
5. Acceptance and testing gaps
6. Wording and formatting issues
