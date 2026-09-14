# Issue Taxonomy

## Severity

| Severity | Meaning |
|----------|---------|
| Blocker | The requirement cannot safely proceed to design or development because a core rule, scope decision, data model, or workflow is missing or contradictory. |
| Critical | Likely to cause wrong implementation, data error, security risk, failed main flow, or major rework. |
| Major | Likely to cause ambiguity, inconsistent implementation, missed test coverage, or non-trivial rework. |
| Minor | Local wording, terminology, formatting, or clarity issue that does not block understanding of the main behavior. |
| Question | A product/business decision is needed; the reviewer should not guess. |

## Issue Types

| Type | Use When |
|------|----------|
| Business logic error | The described rule is wrong, impossible, or contradicts the intended business outcome. |
| Rule conflict | Two or more rules produce incompatible behavior. |
| Rule missing | A necessary condition, branch, boundary, or outcome is absent. |
| Ambiguity | Multiple reasonable interpretations exist. |
| Data relationship gap | Entity relationship, ownership, uniqueness, synchronization, or lifecycle is unclear. |
| State gap | Status values, transitions, invalid states, or terminal states are absent or inconsistent. |
| Permission gap | Role, authorization, visibility, override, or sensitive action control is absent or inconsistent. |
| Exception gap | Failure path, retry, timeout, cancellation, rollback, or compensation is missing. |
| Cross-module inconsistency | Modules use different names, rules, states, or side effects for the same concept. |
| External dependency gap | Required behavior of another system, API, environment, or manual process is unclear. |
| Testability gap | QA cannot derive deterministic tests or expected results. |
| Implementation risk | The requirement leaves architecture, concurrency, performance, migration, or operational risk unresolved. |
| Wording defect | Typo, unclear phrase, duplicate sentence, or misleading term. |

## Finding Format

Use this shape for important findings:

| Field | Guidance |
|-------|----------|
| ID | Stable identifier, e.g. `BR-CR-001` |
| Severity | Blocker, Critical, Major, Minor, Question |
| Type | One issue type from the taxonomy |
| Module | Affected module or "Cross-module" |
| Location | Section, line, table, or source phrase |
| Finding | Specific issue |
| Why It Matters | Business, implementation, data, security, or QA impact |
| Recommendation | Concrete fix direction |
| Suggested Text | Optional ready-to-insert wording |
| Test Scenarios | Optional scenarios QA should cover |

## Severity Calibration

Escalate severity when:

- The issue affects a main user flow.
- The issue can corrupt or lose data.
- The issue can bypass permissions or expose sensitive data.
- Engineers cannot make a deterministic implementation decision.
- QA cannot verify the behavior.
- Multiple modules depend on the unclear rule.

Downgrade severity when:

- The issue is local and has an obvious interpretation.
- It does not affect implementation behavior.
- It is purely editorial.

