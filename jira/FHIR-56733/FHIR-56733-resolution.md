# Proposed Resolution for FHIR-56733

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56733 |
| Issue Type | Change Request |
| Summary | ImagingStudy obligations on the Imaging Report Provider include image-level data (series, instances, endpoint) typically owned by the PACS / VNA. Soften. |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

There's broad obligations of the Imaging Report Provider to provide ImagingStudy content that they would not always own — specifically elements specific to the images themselves that would typically be owned by the PACS/VNA (series, instance, etc.).

Imaging Study obligations also include SHALL requirements for effectively the DICOM manifest data for the imaging study, including endpoint to acquire DICOM data, full enumeration of all series, and instances within that DICOM study. The system owning the image data will not always be the same system as the Imaging Report Provider, and therefore the SHALL obligation does not make sense for this information inside the Imaging Report.

Proposed resolution:

Obligations should be MAY, or scoped to actors that own the underlying data.

Reporter(s): Patrick Gorman, Epic; Calvin Crino, Epic

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Triaged**
- Resolution: **Unresolved**
- Classification: **Pending Governance Review**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Triaged and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

---

### Disposition B: Alternative Approach

#### Proposal

Address the underlying need of the ticket through an alternative mechanism or different approach that differs from what was literally requested.

#### Justification

Alternative approaches may better align with existing patterns, minimize implementation burden, or provide better long-term maintainability while still addressing the ticket's core concern.

---

### Disposition C: Decline

#### Proposal

Decline the request with clear rationale (e.g., out of scope, insufficient use cases, already addressed by existing mechanism, breaking change not justified).

#### Justification

Declining may be appropriate if the change would introduce unnecessary complexity, conflict with design principles, or if existing mechanisms already address the need.

---

## Next Steps

- [ ] Present ticket to imaging work group for review
- [ ] Obtain work group consensus on disposition
- [ ] Assign to implementation team if approved
- [ ] Create GitHub issue/PR for approved changes
- [ ] Link GitHub artifacts in ticket comments
- [ ] Update ticket status upon resolution
- [ ] Document disposition rationale

### Verification Checklist

- [ ] Work group review completed
- [ ] Disposition decision documented
- [ ] Implementation assigned (if approved)
- [ ] GitHub artifacts created (if applicable)
- [ ] Ticket status updated
- [ ] Community notified

---

*Resolution generated: 2026-05-07*  
*Ticket Status: Triaged → Awaiting Governance Review*  
