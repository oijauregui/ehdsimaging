# Proposed Resolution for FHIR-56743

## Ticket Summary

| Field | Value |
| --- | --- |
| Key | FHIR-56743 |
| Issue Type | Technical Correction |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |
| Raised in Version | 1.0.0-ballot |
| Related Sections | artifacts-structural - Identifier description |

## Description

Identifier.value Description and Constraints states "the value that is unique". This need not be unique, even within the namespace. Organizations may have historical conversions, or multiple reports can share an accession. The current wording also does not state uniqueness scope.

Requested direction:
- Specify scope of uniqueness within the namespace defined by Identifier.system, not globally.
- Acknowledge that accession values may not be perfectly unique in practice due to legacy conversions, multi-system handling, and shared accessions.

## Implementation Status

Status: Pending governance decision.

Current implementation evidence indicates the wording remains unchanged in rendered outputs:
- R4 rendered artifacts still include "The value that is unique" (for example in the Accession Number identifier profile and other identifier usages).
- R5 rendered artifacts still include "The value that is unique" (for example in the Accession Number identifier profile and other identifier usages).

No implementation evidence found in ticket comments:
- No linked pull requests
- No linked commits
- No linked implementation issue references

### Implementation Details (if Applied)

Not applicable yet. No applied implementation identified.

## Related Tickets

No parent key or grouping metadata was present in the ticket markdown.

## Disposition Analysis

### Disposition Taken

Pending.

### Rationale

The ticket is in Submitted status with unresolved resolution, and there is no linked implementation evidence. This indicates the work group has not yet finalized disposition and no merged specification wording update is documented.

### Evidence

- Ticket status markers: Submitted / Unresolved
- Ticket narrative explicitly requests clarification of uniqueness scope for Identifier.value
- Rendered IG outputs (R4 and R5) still show the old short text: "The value that is unique"

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Update the Identifier.value short/description text in relevant imaging profiles (at minimum accession-focused profiles and any copied identifier text in profile constraints) to explicitly scope uniqueness to Identifier.system and to warn that operational uniqueness may not always hold.

Proposed normative wording pattern:

"The unique identifier value within the namespace defined by system. For some clinical identifiers (for example accession numbers), uniqueness within that namespace is intended but may not always be achievable in practice (for example legacy conversions). Consumers should not treat value alone as a globally unique key."

Apply this consistently in both R4 and R5 generated artifacts by updating the source profile definitions so generated pages align.

#### Justification

This directly resolves ambiguity called out in the ticket, aligns with Identifier semantics in core FHIR (system + value context), and reduces implementer risk from over-assuming global uniqueness of raw identifier values.

---

### Disposition B: Alternative Approach

#### Proposal

Keep the Identifier.value short text unchanged where inherited, but add explicit implementation guidance in the imaging IG narrative pages and profile comments for accession-related identifiers:
- Clarify that accession identity should be interpreted as (system, value), not value alone.
- Add an interoperability note recommending additional disambiguators (for example assigning authority context, imaging system identifier, and/or report context) when accession collisions occur.

#### Justification

This minimizes profile-level churn and avoids broader wording propagation while still giving implementers practical guidance. It is lower risk for ballot-cycle editorial scope but less strong than explicit profile element text updates.

---

### Disposition C: Decline

#### Proposal

Decline the requested wording change on grounds that the current short description is inherited and sufficiently addressed by existing Identifier.definition/comment semantics in base FHIR.

#### Justification

Declining could be defended if the work group considers this an implementation education issue rather than a specification defect. However, this leaves ambiguity for accession workflows and may perpetuate inconsistent assumptions by implementers.

---

### Recommendation

**Recommended disposition:** A

Accepting as requested gives the clearest and most interoperable outcome. The issue is concrete, impacts real-world accession handling, and can be fixed with targeted wording updates that preserve core FHIR semantics while reducing ambiguity. Compared with B, disposition A is stronger because the clarification appears directly where implementers read and validate element semantics.

## Next Steps

Ready for Review.

### Verification Checklist

- [ ] Work group review completed
- [ ] Implementation code committed
- [ ] Verification in main branch
- [ ] Documentation updated
