# Proposed Resolution for FHIR-56738

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56738 |
| Issue Type | Change Request |
| Summary | §4 defines three data-format levels (minimal-metadata Collection bundle, section-structured Document bundle, fully-structured); the differentiation is unclear and the "metadata" vs "data" naming confuses |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

§4 (data-formats.html) defines three formats: minimal (Bundle of type collection, no Composition), section-structured (Bundle of type document), and fully structured (same Bundle, plus Observations/Conditions for findings).

The boundaries are unclear:


	"Minimal metadata" misnames the variant — what's minimal is structured data, not metadata.
	Section-structured and fully-structured aren't really distinct formats; they share the same Bundle profile and Composition, differing only in whether findings are populated as discrete resources. That's a continuum, not two formats.
	No guidance on when to use the minimal Collection variant.



Proposed resolution:


	Rename "minimal metadata" to something like "minimum structured data".
	State when the minimal Collection variant is appropriate (e.g., only a PDF and identifiers are available).
	Collapse section-structured and fully-structured into one "structured format" with discrete findings as optional, or describe them as a continuum without naming them as separate formats.



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
