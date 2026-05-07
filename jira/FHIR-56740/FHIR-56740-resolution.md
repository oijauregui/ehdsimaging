# Proposed Resolution for FHIR-56740

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56740 |
| Issue Type | Change Request |
| Summary | informationRecipient on Composition is ambiguous; tie it to a specific clinical role (ordering provider, CC provider) rather than a generic recipient slot |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The informationRecipient extension on CompositionEuImaging (slice name informationRecipient, sourced from the EU extension $information-recipient-url) is currently un-anchored to a specific clinical concept. As written, it admits at least two readings:


	A system / transaction recipient — the party that requested or queried the report (and would change per request).
	A clinical recipient — the original ordering provider, the CC list, or other care-team roles tied to the underlying request.



This ambiguity was previously raised in FHIR-51310 "Clarify Composition.InformationRecipient Usage" (Josh, 2025-06-27 against R5 0.1.0-ballot, currently Triaged). The same ambiguity persists in 1.0.0-ballot.

Proposed resolution:

Tie informationRecipient to a specific clinical role rather than leave it as a generic recipient slot. Concretely:


	Define the extension's intended meaning as the clinical recipient(s) of the report — for example, the ordering provider (the authorizing provider for the imaging) and any CC providers explicitly designated to receive the result.
	Where this content already exists on the underlying request (e.g., the ordering provider via DiagnosticReport.basedOn → ServiceRequest.requester), constrain informationRecipient to be consistent with those fields rather than carry independent state.
	If a system / transaction recipient is also needed, that belongs in transaction-level metadata (e.g., the logging component) — not on the Composition.



This resolves the ambiguity by anchoring the extension to clinical fields rather than leaving its semantics open.

Reporter(s): Brian Swinkels, Epic; Josh Priebe, Epic

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
