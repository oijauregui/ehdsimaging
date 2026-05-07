# Proposed Resolution for FHIR-56737

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56737 |
| Issue Type | Change Request |
| Summary | Add guidance for handling generic orderables vs specific performables; clarify which request is communicated |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The "Order" subsection of §10.2.1.2.2 currently says the order section "contains information on the orders that resulted in the studies and this report" and represents the order using ServiceRequestOrderEuImaging. It does not address the common workflow split between a "generic" orderable issued by the Placer and a more specific performable issued by the Fulfiller.

We suggest adding guidance to this section for how this is handled. Placers may indicate a more general request for imaging to resolve some clinical question (such as "imaging of the knee for pain"), with the radiology department then protocoling the request and indicating that a more specific procedure should be performed. Depending on the underlying logic of the RIS, that may all correspond to one order, but it could be represented as separate codes on the ServiceRequest and the Procedure, or even as multiple ServiceRequests (one made by the Placer, and then one or more made by the Fulfiller as part of fulfilling that request).

Proposed resolution:

Add explicit guidance to §10.2.1.2.2 on which request within the Placer/Fulfiller workflow should be communicated in this section — for example, that the Placer's ServiceRequest is the one represented by ServiceRequestOrderEuImaging, with the more-specific Fulfiller-side procedure represented separately on the Procedure.

Reporter(s): Brian Swinkels, Epic

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
