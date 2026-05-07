# Proposed Resolution for FHIR-56481

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56481 |
| Issue Type | Change Request |
| Summary | Inconsistent handling of image references in DiagnosticReportEuImaging |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | DiagnosticReport: Imaging Report |
| Reporter | HELTONHATORI |
| Assignee | Unassigned |
| Created | 4/24/26 |


## Description

We have identified a discrepancy between the formal profile definition and the narrative guidance.

The DiagnosticReportEuImaging profile currently constrains the media element to accept only the Media resource.

However, the guide's section 8.13 recommends using DocumentReference for images stored outside PACS, and ImagingSelection for images stored inside PACS.

This inconsistency may lead to implementation difficulties or misinterpretation.

Could you please clarify whether the profile constraint is intended to be changed to align with the narrative recommendation, or whether the guidance text will be revised to match the current profile?

Thank you for your attention to this matter.

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
