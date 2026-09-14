---
name: prd-review
description: Use when the user asks for deep business review of PRDs, requirement documents, product specs, feature proposals, or business process docs. Focus on understanding business model, modules, data relationships, flows, permissions, states, rules, omissions, contradictions, ambiguities, implementation risk, and testability; do not treat the task as a formatting or template-compliance scorecard.
license: MIT
---

# PRD Review

This skill performs a deep PRD and requirements quality audit. It is for understanding and challenging the business logic in a requirement document, not for checking whether a document follows a fixed template.

## Core Intent

Review whether the requirement is correct, clear, consistent, complete, implementable, and testable.

Before criticizing, build a business understanding:

- Business goal and system boundary
- Actors, roles, and permissions
- Business objects and data relationships
- Module responsibilities and module boundaries
- Core workflows and state transitions
- Cross-module dependencies and side effects
- Normal, exception, boundary, retry, rollback, and audit rules

Distinguish explicitly between:

- **Stated**: directly present in the source document
- **Inferred**: reasonable inference from the document
- **Missing**: required for implementation or testing but absent
- **Question**: must be confirmed by product/business owner

## When To Use

Use this skill when the user asks to:

- Deeply review a PRD or requirement document
- Find business logic errors, omissions, contradictions, or ambiguity
- Evaluate module relationships, internal rules, and cross-module flows
- Check whether developers and testers can implement and verify the requirement
- Produce detailed modification advice, not just a score

Do not use this as the primary skill when the user only wants grammar cleanup, document formatting, or a fixed delivery checklist review.

## Required Workflow

1. **Ingest source material**
   - Read the user-provided document(s), preserving section names and locations.
   - For DOCX/PDF inputs, extract text with the appropriate document tooling.
   - Note unreadable diagrams, external links, missing attachments, or image-only flowcharts.

2. **Load review framework**
   - Read `references/review-framework.md` before the first substantive review.
   - Read `references/issue-taxonomy.md` before classifying findings.
   - Read `references/report-template.md` before writing the final report.
   - Read additional reference files only when needed:
     - `references/module-review-template.md` for per-module review.
     - `references/cross-module-checklist.md` for module interaction and consistency checks.
     - `references/business-rule-checklist.md` for rules, states, data, permission, and exception checks.
     - `references/requirement-quality-checklist.md` for clarity, consistency, priority, terminology, data definition, and ambiguity checks.

3. **Build business model first**
   - Summarize the business goal, system boundary, actors, objects, modules, flows, states, data dependencies, and permissions.
   - Mark each important point as Stated, Inferred, Missing, or Question.
   - If the business model cannot be built, report blockers before issuing detailed findings.

4. **Perform module-level review**
   - For each module, identify responsibilities, inputs, outputs, dependencies, rules, states, permissions, normal flow, exception flow, and missing decisions.
   - Find internal contradictions, underspecified rules, incomplete states, ambiguous wording, and test gaps.
   - Check whether business rules are explicitly defined and whether requirement descriptions are unambiguous enough for design, development, and QA.

5. **Perform cross-module review**
   - Check whether upstream data exists before downstream use.
   - Check consistency of field definitions, conflict handling, permissions, retries, status names, and side effects.
   - Check consistency of terminology, feature descriptions, data definitions, priority labels, and priority criteria.
   - Check whether data changes in one module affect other modules and whether those effects are specified.

6. **Assess implementation and testing risk**
   - Identify rules that cannot be implemented deterministically.
   - Identify acceptance criteria or test cases that cannot be derived from the current document.
   - Identify external system, data migration, concurrency, audit, rollback, and security risks.

7. **Write findings with fixes**
   - Every important finding must include why it matters, impact, specific recommendation, and a suggested replacement/addition when useful.
   - Do not merely say "missing acceptance criteria"; name the concrete scenario and propose testable wording.
   - Put open business decisions into a separate "Questions For Product" section.

## Output Expectations

The final report should be actionable for product, engineering, and QA.

Include:

- Overall conclusion: whether the requirement is ready for design/development/testing.
- Business understanding: concise model of the domain as read from the document.
- Key risks: the highest impact logic, data, permission, or testability risks.
- Module-level findings.
- Cross-module findings.
- Detailed findings table.
- Suggested document changes, including suggested wording for high-value fixes.
- Questions for product/business owner.
- Suggested test scenarios.

Scoring is optional. If a score is useful, keep it secondary to the findings and rationale.

## Review Discipline

- Do not invent facts. Label inferences.
- Do not stop at template gaps. Find business and rule gaps.
- Do not treat screenshots or diagrams as sufficient when the underlying rules are not specified.
- Do not require a single universal template; adapt the review to the document's domain.
- Prefer precise, cited findings over broad criticism.
- Use source section names, line numbers, headings, or quoted short phrases to locate issues.
- Keep the tone firm, specific, and constructive.
