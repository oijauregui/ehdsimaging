# Proposed Resolution for FHIR-56730

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56730 |
| Issue Type | Change Request |
| Summary | HL7IDRCommunication is a bare 0..1 Reference with no target type; cannot carry method, time, recipient, ack |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The Communication extension is a bare Reference (0..1) with no target resource type specified in the snapshot. As written it:


	(a) cannot distinguish critical-result communication (ACR closed-loop / callback) from routine fax/email delivery from portal posting;
	(b) does not carry time, method (phone/fax/email/portal), recipient, or acknowledgment;
	(c) is 0..1, even though a single report can have multiple communication events (referring-physician callback, automated fax, patient portal posting).



Several EU regions (and ACR guidance by reference) require documented closed-loop communication for critical findings. A bare Reference with no target type means two conformant producers could reference different resource types and neither consumer would know what to expect.

Proposed resolution:

(1) Constrain the target type to Reference(Communication) — the FHIR Communication resource natively supports medium, sent/received, recipient, topic, and payload.
(2) Raise cardinality to 0..*.
(3) Add §9 guidance specifically on representing ACR-style critical-result closed-loop communication (time of first attempt, method, acknowledgement).

Reporter(s): Dan Schon, Epic

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
