# Proposed Resolution for FHIR-51305

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51305 |
| Issue Type | Change Request |
| Summary | Expand on Guidance for Comparison Studies |
| Status | Resolved - change required |
| Resolution | Not Persuasive with Modification |
| Related Artifacts | Imaging Composition [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/27/25 |


## Description

ImComposition includes a section for ComparisonStudy referencing IM imaging Study or Imaging Selection. 


We would suggest adding guidance that these SHOULD be populated even if the images used for comparison did not originate at the current record-holder. In some cases, the current record-holder may not have a persistent copy of the images either if they had to rely on a viewer.

## Implementation Status

**Status**: Alternative or Pending  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Resolved - change required**
- Resolution: **Not Persuasive with Modification**
- Classification: **Alternative or Pending**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Resolved - change required and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Resolved - change required → Awaiting Governance Review*  
