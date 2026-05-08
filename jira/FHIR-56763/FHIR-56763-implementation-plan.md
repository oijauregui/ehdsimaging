# Implementation Plan for FHIR-56763

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56763 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution Source | Proposed Resolution File (`FHIR-56763-resolution.md`) |
| Resolution/Disposition | Disposition A — Accept As Requested |
| Summary | Editorial: Xt-EHR link in §1.1 is broken |

## Resolution Interpretation

Disposition A accepts the reporter's proposal: update the broken URL
`useCaseMedicalImages.html` → `overview-medicalimages.html` in
`ig-src/input/includes/variable-definitions.md` for both the `XtEhrImaging` and
`XtEhrImagingHtml` Liquid variables. Additionally, fix the stray `)` inside the
`href` attribute of `XtEhrImagingHtml`, which produces a malformed anchor tag.

The correct URL is confirmed by its presence in `ig-src/sushi-config.liquid.yaml`
line 171 (the Functional menu entry).

## Scope and Impact

### Affected Artifacts

- `XtEhrImaging` Liquid variable — references the stale URL
- `XtEhrImagingHtml` Liquid variable — references the stale URL and has a stray `)` in the `href`

### Candidate Files

- `ig-src/input/includes/variable-definitions.md` lines 14–15 — update both Liquid variable definitions

### Impact Notes

- R4 impact: Low — rendered HTML pages that include `XtEhrImaging` or `XtEhrImagingHtml` will show the corrected link
- R5 impact: Low — same as R4; both IG versions share the same `ig-src` includes
- Breaking change risk: **Low** — purely editorial URL correction; no profile, cardinality, or terminology change

## Implementation Tasks

1. **Fix `XtEhrImaging` Liquid variable URL**
   - File: `ig-src/input/includes/variable-definitions.md` (line 14)
   - Action: Replace `useCaseMedicalImages.html` with `overview-medicalimages.html` in the markdown link URL
   - Before:
     ```liquid
     {% assign XtEhrImaging      = "[Xt-EHR Imaging Logical Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html)" %}
     ```
   - After:
     ```liquid
     {% assign XtEhrImaging      = "[Xt-EHR Imaging Logical Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html)" %}
     ```
   - Acceptance: Line 14 contains `overview-medicalimages.html` and no occurrence of `useCaseMedicalImages.html`

2. **Fix `XtEhrImagingHtml` Liquid variable URL and malformed `href`**
   - File: `ig-src/input/includes/variable-definitions.md` (line 15)
   - Action: Replace `useCaseMedicalImages.html)` with `overview-medicalimages.html` (update URL and remove the stray `)`)
   - Before:
     ```liquid
     {% assign XtEhrImagingHtml  = '<a href="https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html)">XtEHR Imaging Logical Model</a>' %}
     ```
   - After:
     ```liquid
     {% assign XtEhrImagingHtml  = '<a href="https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html">XtEHR Imaging Logical Model</a>' %}
     ```
   - Acceptance: Line 15 contains `overview-medicalimages.html"` (no trailing `)` before the closing quote) and no occurrence of `useCaseMedicalImages.html`

## Validation Plan

- [ ] Source files updated in `ig-src/input/includes/variable-definitions.md` (lines 14–15)
- [ ] No remaining occurrences of `useCaseMedicalImages.html` in `ig-src/` (run `grep -r "useCaseMedicalImages" ig-src/`)
- [ ] Preprocessing completed: `./_preprocessMultiVersion.sh`
- [ ] Both IG versions build without errors: `./_preProcessAndCheckAll.sh` (or `./_genonce.sh` for a faster editorial check)
- [ ] Rendered output pages referencing `XtEhrImaging`/`XtEhrImagingHtml` in `igs/imaging-r4/` and `igs/imaging-r5/` show the corrected link
- [ ] Corrected link is clickable and resolves in the Xt-EHR CI build
- [ ] No unresolved placeholders or broken links introduced by the edit

## Open Questions

None — the broken URL, correct replacement URL, and exact file location are all confirmed by the resolution file's Source Analysis.
