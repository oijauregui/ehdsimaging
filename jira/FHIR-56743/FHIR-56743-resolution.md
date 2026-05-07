# Proposed Resolution for FHIR-56743

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56743 |
| Issue Type | Technical Correction |
| Summary | Identifier.value description states "the value that is unique"; accession is not always unique. Update wording. |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

Identifier.value Description and Constraints — states "the value that is unique". This need not be unique, even within the namespace. Organizations may have historical conversions, or you can have multiple reports share an accession. It also doesn't make sense to say "unique" without specifying what it is unique with respect to.

Proposed resolution:

Replace the current "the value that is unique" wording with something that:


	Specifies the scope of uniqueness (i.e., uniqueness is asserted within the namespace defined by Identifier.system, not globally), and
	Explicitly acknowledges that accession values may not be perfectly unique even within a system due to historical conversions, multi-A# handling, and shared accessions across reports.



For example: "value is the identifier value within the namespace defined by system. Note that for some clinical identifiers — accession number being a common case — uniqueness within the namespace is the intent but is not always achievable in practice (legacy conversions, multi-system shared accessions). Consumers should not rely on value alone as a globally unique key."

Reporter(s): Brian Swinkels, Epic

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
