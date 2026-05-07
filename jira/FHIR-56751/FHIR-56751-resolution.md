# Proposed Resolution for FHIR-56751

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-56751 |
| Issue Type | Technical Correction |
| Summary | Several CompositionObligation elements have MAY:able-to-populate redundant with cardinality including 0, or MAY/SHOULD on non-zero cardinality. Reconcile. |
| Status | Submitted |
| Resolution | Unresolved |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 4/30/26 |


## Description

There are multiple instances of elements with a cardinality including 0, and having an obligation of MAY:able-to-populate. This kind of obligation doesn't appear to make any additional statement of what the implementor is supposed to do in this case. Affected: extension:basedOn, extension:version.

There are also instances of elements with a cardinality excluding 0, and having an obligation of MAY:able-to-populate or SHOULD:able-to-populate. This kind of obligation seems contradictory with the cardinality — if implementors MAY or SHOULD populate, how can the cardinality be strictly non-zero? Affected: status (MAY); attester:resultValidator.time and section:order (SHOULD).

Per HL7 obligation code system, MAY:able-to-populate is the null obligation — it doesn't actually imply any obligation on the actor.

Proposed resolution:

Remove the MAY:able-to-populate obligations on cardinality-including-0 elements. For elements where cardinality excludes 0, remove the obligation in favor of marking the element with a cardinality including 0.

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
