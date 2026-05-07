# Proposed Resolution for FHIR-56735

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56735 |
| Issue Type | Change Request |
| Summary | Radiation dose is duplicated as both an extension and an entry pointing at generic Resource. Drop the extension; constrain the entry to Observation. |
| Status | Triaged |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

Radiation dose is listed as both an extension and an entry within section:procedure. The entry references a generic Resource. Additionally, DiagnosticReport.extension:radiationDose is typed as string, which leaves ambiguity in actual dosing units and value; it's also not uncommon for dose to be maintained and stored outside of the Report Provider system (RIS/etc).

Proposed resolution:

Rather than having essentially duplicate elements, remove the extension. Then point entry:radiation-dose to an Observation. The surviving Observation should be understood as a textual summary of dose, not the full structured dose model.

Reporter(s): Matt Hannan, Epic; Patrick Gorman, Epic; Dan Schon, Epic

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
