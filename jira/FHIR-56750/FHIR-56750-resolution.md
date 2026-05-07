# Proposed Resolution for FHIR-56750

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56750 |
| Issue Type | Technical Correction |
| Summary | Phrasing is circular ("if supported, must support"); rewrite to specify what triggers the SHALL |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

Throughout both the Provider and Consumer CapabilityStatements, there is this statement: "If supported, clients SHALL support...". These seem to contradict each other; doesn't "SHALL" mean that you must support?

A clearer model from elsewhere: &gt; Condition resources represent problems, diagnoses, and health concerns. If supported, servers SHALL support search by patient and SHOULD support additional filters.

Proposed resolution:

Rewrite each occurrence to make the trigger explicit. Follow the IPA STU1 pattern, which uses an explicit triggering condition before the conformance verb — for example:

If an external Medication Resource is used in a MedicationStatement or a MedicationRequest, then the READ and SEARCH Criteria SHALL be supported.

Apply the same pattern here: identify the specific feature or scenario that activates the SHALL, then state the requirement. Avoid using "supported" twice in the same sentence.

Reporter(s): Matt Hannan, Epic

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
