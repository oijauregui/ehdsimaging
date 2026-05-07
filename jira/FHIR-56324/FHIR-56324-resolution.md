# Proposed Resolution for FHIR-56324

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56324 |
| Issue Type | Question |
| Summary | References to FHIR standard resources |
| Status | Waiting for Input |
| Resolution | Unresolved |
| Reporter | HELTONHATORI |
| Assignee | Bas van den Heuvel |
| Created | 4/10/26 |


## Description

Regarding the references, we have noticed that some elements reference standard FHIR resources. Should they not reference EuCore or other specific resources when available? For example:

	DocumentReferenceImagingReport.author




	AdverseEventEuImaging.subject



Could you please clarify the intended approach in such cases?

## Implementation Status

**Status**: Pending Input  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Waiting for Input**
- Resolution: **Unresolved**
- Classification: **Pending Input**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Waiting for Input and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Waiting for Input → Awaiting Governance Review*  
