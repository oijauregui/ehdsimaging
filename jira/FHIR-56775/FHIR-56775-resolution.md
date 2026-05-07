# Proposed Resolution for FHIR-56775

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56775 |
| Issue Type | Technical Correction |
| Summary | Editorial: small fixes to Resource Access Provider / Consumer CapabilityStatements |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

Four small fixes:


	§11.5.3.3 — Scopes for supported resources includes system/Observation.read, system/Observation.search, then system/Composition.read, system/Observation.search (the second Observation.search is added in error and should be removed). Composition.search is intentionally not defined.
	§11.5.3.4.12 — Description column for subject and status parameters are flipped.
	Consumer scopes (§11.6.3.3) — patient.read/search is listed twice; order of listing of scopes is inconsistent with the Provider.



Proposed resolution:

Remove duplicate scopes; correct flipped descriptions; consistent sorting of scopes between capability statements.

Reporter(s): Calvin Crino, Epic

## Implementation Status

**Status**: Pending Decision  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Submitted**
- Resolution: **Unresolved**
- Classification: **Pending Decision**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Submitted and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Submitted → Awaiting Governance Review*  
