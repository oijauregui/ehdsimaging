# Proposed Resolution for FHIR-56722

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56722 |
| Issue Type | Change Request |
| Summary | The IG offers two paths to the same imaging report data (DocumentReference search and DiagnosticReport search); add guidance differentiating when to use each |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The IG specifies several containers for report content with overlapping content (DocumentReference → Document Bundle → DiagnosticReport).

Both DocumentReference-based search and DiagnosticReport-based search arrive at the same underlying clinical data (the FHIR Document for the imaging report). Both are valid patterns in FHIR. The IG should differentiate when to use each rather than collapse them into a single path.

DiagnosticReport-based search exposes more clinically relevant fields natively (patient, date, code, status, category, performer) and is better suited to complex queries. DocumentReference-based search is simpler, compatible with document-based systems, and well-suited as a baseline discovery floor.

Proposed resolution:

Add narrative to §4 (and align §6 / §9.1) stating that the IG supports two complementary search paths to the same imaging report data:


	DocumentReference-based search — recommended as a baseline / discovery floor. Compatible with document-based systems; all conformant servers should support it for finding documents by patient, date, type, etc.
	DiagnosticReport-based search — recommended for complex / clinically detailed queries (search by code, status, category, performer, etc.). Once a DiagnosticReport is discovered, the associated Document Bundle can be generated via $document if needed.



Differentiate the use of the tools: DiagnosticReport scales to richer clinical queries, while DocumentReference is a good shared floor.

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
