# Requirement Quality Checklist

Use this checklist to explicitly evaluate requirement clarity and consistency. It complements the business rule, module, and cross-module checklists.

## Business Rule Clarity

Check whether every important business rule has:

- A clear trigger condition.
- Preconditions and applicable roles.
- Input data and validation criteria.
- Success behavior and resulting state/data changes.
- Failure behavior and user-visible feedback.
- Exception, boundary, retry, rollback, or compensation rules where relevant.
- Observable acceptance criteria or test oracle.

Flag a finding when a rule is only implied by a screenshot, flowchart, UI label, example, or local paragraph but is not stated as deterministic behavior.

## Consistency Checks

### Terminology Consistency

- The same business object uses the same name across the document.
- Synonyms are either avoided or defined in a glossary.
- Abbreviations, codes, IDs, statuses, roles, modules, and field names have stable meanings.
- UI labels, API/data names, and business terms do not silently refer to different concepts.

### Feature Description Consistency

- The same feature behaves consistently across overview, process, UI, rule, and acceptance sections.
- A rule stated in one module is not contradicted by another module, entry point, or exception flow.
- Create, edit, import, transfer, retry, overwrite, delete, and download behavior follow consistent logic unless the difference is explicitly justified.
- Screenshots, flowcharts, and text describe the same behavior.

### Data Definition Consistency

- Each field has one definition, format, source, ownership, required/optional status, and uniqueness scope.
- Identifiers such as user ID, role ID, task ID, batch ID, SN, MAC, VIN, SEID, order ID, customer ID, and device ID are not reused with different meanings.
- Derived fields and copied fields identify their source of truth.
- Data examples match declared formats and validation rules.

### Priority Consistency

- Priority labels are defined before use, for example P0/P1/P2, Must/Should/Could, or High/Medium/Low.
- The same priority level means the same urgency and delivery expectation across modules.
- Priority aligns with business criticality, dependencies, release scope, and acceptance expectations.
- Priority does not conflict with stated scope, roadmap, or dependency order.
- Optional features are not described as release blockers unless explicitly justified.

### Contradiction Detection

Look for contradictions between:

- Business goals and detailed rules.
- Main flow and exception flow.
- Module descriptions and cross-module behavior.
- Permission rules and available UI operations.
- Data creation rules and data import/transfer rules.
- Status definitions and allowed actions.
- Acceptance criteria and functional descriptions.
- Text descriptions and diagrams/screenshots.

## Ambiguity Checks

A requirement is ambiguous when two reasonable readers can implement or test it differently.

Check for:

- Vague verbs: support, handle, optimize, improve, manage, process, sync, validate, normal, abnormal.
- Undefined thresholds: fast, large, recent, frequent, timeout, retry several times.
- Unspecified actor: system, user, admin, operator, platform, backend.
- Unspecified object: data, record, task, status, result, configuration.
- Unspecified timing: after, before, when complete, eventually, periodically.
- Unspecified scope: all, some, current environment, target environment, related data.
- Unspecified conflict behavior: overwrite, skip, merge, block, retry, manual handling.
- Unspecified permission: who can view, create, edit, delete, download, import, transfer, override, retry, approve.

For each ambiguity finding, include:

- The competing interpretations.
- Why the ambiguity matters.
- The recommended decision or wording.
- A testable acceptance criterion.

## Output Guidance

When quality issues are material, include a dedicated section in the report:

```markdown
## Requirement Clarity And Consistency

| Area | Result | Key Issues | Recommendation |
|------|--------|------------|----------------|
| Business rules |  |  |  |
| Terminology |  |  |  |
| Feature consistency |  |  |  |
| Data definitions |  |  |  |
| Priority |  |  |  |
| Contradictions |  |  |  |
| Ambiguity |  |  |  |
```

