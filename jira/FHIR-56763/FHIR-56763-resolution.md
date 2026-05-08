# Proposed Resolution for FHIR-56763

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56763 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe (on behalf of Brian Swinkels, Epic) |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Raised in Version | 1.0.0-ballot |
| Related Section | §1.1 |

## Description

In §1.1 the Xt-EHR link is broken:

> `https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html`

The reporter proposes simply updating the link.

## Implementation Status

**Pending** — no implementation has been applied. The ticket is unresolved with no linked PRs or commits.

## Source Analysis

The broken URL `useCaseMedicalImages.html` appears in:

- [`ig-src/input/includes/variable-definitions.md`](../../ig-src/input/includes/variable-definitions.md) lines 14–15, where the Liquid variables `XtEhrImaging` and `XtEhrImagingHtml` are defined:

  ```liquid
  {% assign XtEhrImaging     = "[Xt-EHR Imaging Logical Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html)" %}
  {% assign XtEhrImagingHtml = '<a href="https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/useCaseMedicalImages.html)">XtEHR Imaging Logical Model</a>' %}
  ```

  Note: `XtEhrImagingHtml` also has a stray `)` inside the URL attribute, making it a malformed anchor tag.

- The corrected URL **already appears** in [`ig-src/sushi-config.liquid.yaml`](../../ig-src/sushi-config.liquid.yaml) line 171 (Functional menu entry):

  ```yaml
  Xt-EHR model: https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html
  ```

The correct URL is: `https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html`

## Related Tickets

None identified.

---

## Disposition Analysis

### Disposition Taken

**Pending** — awaiting work group review.

### Rationale

The URL `useCaseMedicalImages.html` no longer resolves in the Xt-EHR CI build. The Xt-EHR project renamed the page to `overview-medicalimages.html`, which is already the URL used correctly in the sushi-config menu entry. The `variable-definitions.md` file was not updated at the same time, leaving the `XtEhrImaging` and `XtEhrImagingHtml` Liquid variables pointing at a stale URL. This is a clear, low-risk editorial fix.

### Evidence

- Broken URL in source: `ig-src/input/includes/variable-definitions.md` lines 14–15
- Correct URL confirmed in source: `ig-src/sushi-config.liquid.yaml` line 171
- No PRs or commits linked in ticket

---

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Update `ig-src/input/includes/variable-definitions.md` lines 14–15 as follows:

```liquid
{% assign XtEhrImaging     = "[Xt-EHR Imaging Logical Model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html)" %}
{% assign XtEhrImagingHtml = '<a href="https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/overview-medicalimages.html">XtEHR Imaging Logical Model</a>' %}
```

Two changes per line:
1. Replace `useCaseMedicalImages.html` → `overview-medicalimages.html`
2. Remove the stray `)` from the `href` attribute in `XtEhrImagingHtml`

#### Justification

The correct URL is already used in the sushi-config menu, so this change aligns both locations and eliminates the drift that caused this ticket. The stray `)` in `XtEhrImagingHtml` is an independent typo that produces a malformed anchor tag and should be corrected at the same time. The fix is purely mechanical and carries no design risk.

---

### Disposition B: Alternative Approach

#### Proposal

Consolidate the Xt-EHR URL to a single definition point (`variable-definitions.md`) and verify all references flow through the Liquid variable. Remove the duplicate hardcoded URL from `sushi-config.liquid.yaml` if the toolchain allows referencing a variable there; otherwise document the two-location pattern to ensure they are kept in sync.

#### Justification

Having the same URL in two separate files (`sushi-config.liquid.yaml` and `variable-definitions.md`) created the synchronisation drift that produced this ticket. Making the variable-definitions file the single source of truth would prevent recurrence. However, sushi-config menu entries cannot reference Liquid variables, so perfect centralisation is not achievable, and this disposition adds scope beyond a Technical Correction.

---

### Disposition C: Decline

#### Proposal

Do not update the link; defer until the Xt-EHR IG has a stable, versioned URL.

#### Justification

The `build.fhir.org` CI build URL could change again if Xt-EHR restructures their IG. However, declining is not defensible: the existing URL is broken today, `overview-medicalimages.html` is already in use in the same repo, and leaving a broken link in the ballot publication harms reviewer confidence without benefit.

---

### Recommendation

**Recommended disposition: A**

Disposition A is a straightforward, low-risk, one-file fix that resolves both the broken URL and the stray `)` typo in `XtEhrImagingHtml`. The correct target URL is confirmed by its presence in `sushi-config.liquid.yaml`. There is no justification for deferral (Disposition C) and Disposition B, while architecturally tidier, is out of scope for a Technical Correction ballot comment.

---

## Next Steps

Ready for Review

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation committed (`ig-src/input/includes/variable-definitions.md` lines 14–15 updated)
- [ ] Verification in main branch
- [ ] Documentation updated
- [ ] Rendered output updated (igs/imaging-r4, igs/imaging-r5)
- [ ] Documentation updated if needed
- [ ] Resolution file finalized and committed

---

*Generated: 2026-05-07T14:25:15.905Z*
*Ticket Status: Submitted*
