# Proposed Resolution for FHIR-56746

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56746 |
| Issue Type | Change Request |
| Summary | Specify how DR.status correlates with addenda; consider reducing the amended/corrected distinction |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

§8.10 addresses addendum via Composition.relatesTo with an "appends" code. But the IG provides no guidance on amendment vs. correction — FHIR DiagnosticReport.status distinguishes amended / corrected / final, but the IG does not map these to workflow.

The distinction between DiagnosticReport.status of amended, corrected, and appended is likely to be unclear in systems which likely do not track if an edit is only an addition of content or only a change to existing content. There are also likely to be edits that both change existing content and append new content.

Proposed resolution:

Specify how DiagnosticReport.status correlates with §8.10's addendum mechanism. Specifically:


	DiagnosticReport.status should be the field that carries the post-final modification semantics (amended vs corrected vs appended).
	The distinction between amended and corrected should be retained and clarified — these have meaningfully different clinical implications and shouldn't be collapsed into a single status.
	Document the correspondence explicitly: a status of amended or corrected should imply (or correspond to) an addendum recorded via Composition.relatesTo "appends".



The IG today leaves this correspondence implicit, which produces inconsistent implementer interpretation.

Reporter(s): Dan Schon, Epic; Angela Harrison, Epic

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
