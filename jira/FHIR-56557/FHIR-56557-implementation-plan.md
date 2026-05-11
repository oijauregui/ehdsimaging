# Implementation Plan for FHIR-56557

## Ticket Summary

| Field | Value |
| --- | --- |
| Key | FHIR-56557 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File |
| Resolution/Disposition | Recommended disposition A (Accept As Requested) |
| Summary | Suggested editorial changes |

## Resolution Interpretation

Implement editorial-only corrections for wording, grammar, and consistency in the Imaging IG narrative pages. Apply changes in authoring sources and verify they render into both R4 and R5 outputs without introducing unresolved placeholders or build regressions.

## Scope and Impact

### Affected Artifacts

- Scope page narrative (`index.md`) - grammar and article fixes
- Use-case overview (`use-cases.md`) - sentence grammar/typo fix
- Related specifications narrative (`use-case-other-specs.md`) - typo and pluralization fixes
- Imaging report narrative (`imaging-report.md`) - grammar fixes and wording consistency

### Candidate Files

- `ig-src/input/pagecontent/index.md` - update pluralization/article/sentence phrasing in Scope bullets
- `ig-src/input/pagecontent/use-cases.md` - fix use-case sentence grammar and typo
- `ig-src/input/pagecontent/use-case-other-specs.md` - fix sentence grammar, typo, and pluralization
- `ig-src/input/pagecontent/imaging-report.md` - fix grammar and wording in overview/sections/versioning bullets

### Impact Notes

- R4 impact: Textual wording updates expected in generated pagecontent
- R5 impact: Textual wording updates expected in generated pagecontent
- Breaking change risk: Low (editorial only; no profile/terminology/cardinality changes)

## Implementation Tasks

1. **Fix Scope wording in index page**
   - File: `ig-src/input/pagecontent/index.md`
   - Action: Correct grammar/plural/article issues in the Scope bullets, including "reports" pluralization and "relation" phrasing.
   - Acceptance: Scope bullets read naturally and retain original meaning.

2. **Fix use-cases intro sentence**
   - File: `ig-src/input/pagecontent/use-cases.md`
   - Action: Correct word order and typo in "obligations" sentence.
   - Acceptance: Sentence is grammatical and uses "utilized" spelling.

3. **Fix related-specifications wording**
   - File: `ig-src/input/pagecontent/use-case-other-specs.md`
   - Action: Correct "so an instance", "unconformities", and "image/serie" phrasing.
   - Acceptance: Paragraph and manifest sentence are grammatically correct and consistent.

4. **Fix imaging-report narrative wording**
   - File: `ig-src/input/pagecontent/imaging-report.md`
   - Action: Correct grammar in overview/section text and versioning bullet wording.
   - Acceptance: All flagged phrases are corrected with no semantic change.

5. **Run preprocess build validation and verify outputs**
   - File: Build pipeline execution
   - Action: Run preprocess build check script and confirm updated text appears in both generated streams.
   - Acceptance: Build passes, or unrelated blockers are documented with evidence.

## Validation Plan

- [ ] Source files updated in the correct authoring location
- [ ] Preprocess/build completed for both versions
- [ ] Rendered outputs reflect the intended change
- [ ] No unresolved placeholders or broken links introduced
- [ ] Ticket intent is fully covered by implemented edits

## Open Questions

- The ticket description mentions some "missing reference" fragments that are not present verbatim in current `ig-src` content; verify whether these were already addressed before this ticket sync.
