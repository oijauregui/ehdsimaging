# Proposed Resolution for FHIR-56739

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56739 |
| Issue Type | Change Request |
| Summary | §9 says all resources reachable via reference chains "should be included in the bundle"; bound the rule to relevant types or chain depth |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

The Document Bundle Resource Inclusion Rules (§9, design-considerations.html, pre-adopting the FHIR R5 inclusion rule) state:

all resources which are part of the reference graph — whether they reference the Composition or are referenced by it, directly or through chains of references — should be included in the Bundle. This approach ensures that all relevant clinical context and supporting data are present for the document consumer.

What does this mean in practice? As an example, are we really meant to pull in AdverseEvent.subject:ResearchSubject → ResearchSubject.study → ResearchStudy.result → EvidenceReport?

Proposed resolution:

Align the IG's resource-inclusion guidance with the FHIR R5 documents specification, which is more carefully bounded:


	Direct references from the Composition (e.g., subject, encounter, author, attester.party, custodian, section.author, section.focus, section.entry) SHALL be included in the bundle when the document is assembled.
	Indirect references (resources reached transitively from those direct references) SHOULD be included, with the explicit caveat from R5 that "FHIR documents are not intended to capture unbounded data sets such as a full EHR".
	Add a clarifying note: indirect references should be included where clinically relevant to the report, not as an unbounded transitive closure.



This avoids the AdverseEvent → ResearchSubject → ResearchStudy → EvidenceReport degenerate case while preserving the document-completeness intent.

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
