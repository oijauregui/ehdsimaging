# Proposed Resolution for FHIR-56771

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56771 |
| Title | Editorial: design-considerations §9.6, §9.9.1, §9.9.2, §9.10 — typos / incomplete thoughts |
| Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe (Brian Swinkels, Epic) |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Raised in Version | 1.0.0-ballot |
| Related Sections | §9 (design-considerations) |

## Description

The reporter identifies four areas in the Design Considerations chapter with typos or incomplete thoughts:

- **§9.6 (linking-to-body-sites)**: typo or incomplete thought
- **§9.9.1 (adverseevent)**: typos or incomplete thoughts
- **§9.9.2 (adverseevent)**: typos or incomplete thoughts
- **§9.10**: typo

## Implementation Status

### Current Status: Submitted (Pending)

No implementation evidence in comments. No GitHub PRs or commits linked. Ticket requires review and implementation of fixes.

## Disposition Analysis

### Ticket Metadata Analysis

This is a **Technical Correction** (editorial) ticket currently in **Submitted** status. The ticket was filed by Brian Swinkels of Epic, reporting a set of typos and grammatical errors. As a ballot comment from a recognized implementer, it warrants acceptance.

### Specific Issues Identified

Analysis of the referenced source files (`ig-src/input/pagecontent/`) and rendered outputs (`igs/imaging-r4/input/pagecontent/`, `igs/imaging-r5/input/pagecontent/`) reveals the following concrete issues:

#### In `design-consideration-linking-to-bodysites.liquid.md` (§9.6 per ticket)

**Issue 1 — Typo in first line:**
```
THe {{ehnImagingGuidelines}} requires...
```
→ Should be: `The {{ehnImagingGuidelines}} requires...`

**Issue 2 — Garbled sentence (incomplete thought):**
```
The third option is allows for searched but does allow to specify further information if needed.
But does require definition of resources that are not providing additional information.
```
Multiple problems: "is allows", "searched" (should be "searching"), and the sentence is fragmented. Proposed fix:
```
The third option allows for searching and does allow specifying further information if needed.
It does however require defining additional resources that are not providing supplementary information.
```

#### In `design-consideration-procedure-adverse-reaction.liquid.md` — Model section (mermaid diagram)

**Issue 3 — Typo in mermaid classDiagram (both R4 and R5 renders):**
```
    occurence
```
→ Should be: `    occurrence`  (missing one `r`)

This appears in the `ImAdverseReaction <<AdverseEvent>>` class in both the R4 and R5 conditional blocks of the liquid template.

**Issue 4 — Truncated FHIR path in R4 mermaid classDiagram (R4 render only):**
```
    reaction.onse
```
→ Should be: `    reaction.onset`  (missing `t`)

This appears only in the `AllergicReaction <<AllergyIntolerance>>` class inside the `{% if isR4 %}` block.

#### In `design-consideration-procedure-adverse-reaction.liquid.md` — §9.9.1 (`#### AdverseEvent resource`)

**Issue 5 — Grammatical error ("mainly is"):**
```
  * The resource focuses mainly is on the registration and monitoring of adverse events.
```
→ Should be: `  * The resource focuses mainly on the registration and monitoring of adverse events.`

#### In `design-consideration-procedure-adverse-reaction.liquid.md` — §9.9.2 (`#### AllergyIntolerance resource`)

**Issue 6 — Contradictory/incomplete thought:**
```
  * There is not a straightforward way to reference to or from a `Procedure` resource, so it can be linked to the main model.
```
"Not a straightforward way… so it *can* be linked" is self-contradictory. Proposed fix:
```
  * There is not a straightforward way to reference to or from a `Procedure` resource, so it cannot be directly linked to the main model.
```

#### In `design-consideration-keyimages.liquid.md` (§9.10 per ticket)

**Issue 7 — Typo ("mey" for "may"):**
```
Another aspect, although unlikely, is that the report mey refer to key images
```
→ Should be: `...is that the report may refer to key images`

### Summary of Issues

| # | File | Nature | Current Text | Proposed Fix |
|---|------|---------|--------------|--------------|
| 1 | linking-to-bodysites | Typo (capital H) | `THe {{ehnImagingGuidelines}}` | `The {{ehnImagingGuidelines}}` |
| 2 | linking-to-bodysites | Garbled sentence | `The third option is allows for searched…` | `The third option allows for searching and does allow specifying further information…` |
| 3 | adverse-reaction (R4+R5) | Typo (missing r) | `occurence` | `occurrence` |
| 4 | adverse-reaction (R4 only) | Truncated path | `reaction.onse` | `reaction.onset` |
| 5 | adverse-reaction §9.9.1 | Grammatical | `focuses mainly is on` | `focuses mainly on` |
| 6 | adverse-reaction §9.9.2 | Contradictory prose | `not a straightforward way … so it can be linked` | `… so it cannot be directly linked` |
| 7 | keyimages | Typo | `report mey refer to` | `report may refer to` |

### Evidence & Links

No GitHub implementation links in ticket comments. All issues identified by direct inspection of source files.

---

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Fix all seven identified typos and grammatical errors in the liquid source files in `ig-src/input/pagecontent/`:

1. **`design-consideration-linking-to-bodysites.liquid.md`**:
   - Line 1: `THe` → `The`
   - Garbled third-option sentence → rewrite to: `The third option allows for searching and does allow specifying further information if needed. It does however require defining additional resources that are not providing supplementary information.`

2. **`design-consideration-procedure-adverse-reaction.liquid.md`**:
   - Both `{% if isR5 %}` and `{% if isR4 %}` mermaid blocks: `occurence` → `occurrence`
   - R4-only mermaid block: `reaction.onse` → `reaction.onset`
   - AdverseEvent cons bullet: `focuses mainly is on` → `focuses mainly on`
   - AllergyIntolerance cons bullet: `so it can be linked to the main model` → `so it cannot be directly linked to the main model`

3. **`design-consideration-keyimages.liquid.md`**:
   - `report mey refer to` → `report may refer to`

The rendered files in `igs/imaging-r4/` and `igs/imaging-r5/` will be updated automatically when the preprocessor is re-run.

#### Justification

All seven issues are clear editorial errors with no ambiguity about intent:
- Typos (`THe`, `occurence`, `reaction.onse`, `mey`) are simple character-level mistakes.
- Grammatical issues (`mainly is on`, `is allows for searched`) are obviously wrong in context and the correct reading is unambiguous.
- The contradictory AllergyIntolerance sentence ("no straightforward way… so it *can* be linked") has a clear correct meaning.
- Fixing these improves the readability and professional quality of the specification without any change to technical content.
- Ballot comments from implementers on editorial quality should be accepted.

---

### Disposition B: Partial Accept — Typos Only

#### Proposal

Accept the simple character-level typo fixes (Issues 1, 3, 4, 7) but treat the prose rewrites (Issues 2, 5, 6) as content decisions requiring work group sign-off on exact wording.

Issue 2 (the "third option" sentence) is sufficiently garbled that the intended meaning should be confirmed by the original author before rewriting. Issue 6 (AllergyIntolerance) involves a potentially deliberate phrasing ("can be linked via encounter") that should be verified.

#### Justification

Reduces risk of accidentally changing the intended meaning while still addressing clear typos. Appropriate if the work group is uncertain about the correct rewrite for the prose issues.

---

### Disposition C: Decline

#### Proposal

Decline on the grounds that all issues are in non-normative design-consideration prose or in mermaid diagram labels, and none affect implementability.

#### Justification

The mermaid labels (`occurence`, `reaction.onse`) are illustrative class diagrams, not normative FHIR paths used in profiles. The prose sections are informative. While this is defensible under strict scope arguments, declining editorial corrections submitted by ballot commenters is not good practice.

---

### Recommendation

**Recommended disposition: A — Accept As Requested**

All seven items are unambiguous editorial errors. There is no technical dispute, no scope question, and no risk of breaking changes. Issues 3, 4, and 7 are trivial typos. Issues 1, 5 are also straightforward. Issue 6 has a clear correct meaning — the AllergyIntolerance resource cannot be directly linked to the Procedure in the model, which is precisely the *con* being listed. Issue 2 requires the most care, but the intent is clear: Option 3 ("always include both") supports richer searching but at the cost of requiring additional resources. The work group should confirm the preferred rewording for Issues 2 and 6 before committing, but full acceptance is strongly recommended.

## Related Tickets

No parent key or grouping specified.

## Next Steps

**Status: Ready for Review**

### Verification Checklist
- [ ] Work group review completed
- [ ] Wording for Issues 2 and 6 confirmed by editor/work group
- [ ] Fixes applied to `ig-src/input/pagecontent/` source files (liquid templates)
- [ ] Preprocessor re-run to propagate fixes to `igs/imaging-r4/` and `igs/imaging-r5/`
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated
- [ ] Rendered output updated (igs/imaging-r4, igs/imaging-r5)
- [ ] Documentation updated if needed
- [ ] Resolution file finalized and committed

---

*Generated: 2026-05-07T14:25:15.906Z*
*Ticket Status: Submitted*
