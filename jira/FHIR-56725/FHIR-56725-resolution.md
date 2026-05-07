# Proposed Resolution for FHIR-56725

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56725 |
| Issue Type | Change Request |
| Summary | Clarify that dictated / free-text result data belongs in Observation, not DiagnosticReport.note |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

There is a section here on representing unstructured text / dictated notes that suggests using DiagnosticReport.note and Composition.section.extension&#91;note&#93;.

This should be clarified to ensure that the difference between a (free text, dictated) result and a note about that result is clear. Result data (even if unstructured) should not be in DiagnosticReport.note — it would be in one or more Observations containing free-text information that the DiagnosticReport references.

Proposed resolution:

Update §8.01 to direct dictated / free-text result text into Observation(s) referenced from DiagnosticReport.result, not into DiagnosticReport.note. Reserve DiagnosticReport.note (and the analogous Composition section note extension) for notes about a result.

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
