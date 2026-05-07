# Proposed Resolution for FHIR-51300

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51300 |
| Issue Type | Change Request |
| Summary | The report (and manifest) require more fields than is needed |
| Status | Resolved - No Change |
| Resolution | Retracted |
| Reporter | Bas van den Heuvel |
| Assignee | Unassigned |
| Created | 6/27/25 |

**Related:**
- Grouping: [Block-Vote-3]


## Description

The report specification has obligations related to data elements from the XtEHR specification. All of these are marked as "SHALL-populate-if-known". This is much to restrictive as many of these elements are not required for an imaging report.

The specification should restrict the SHALL-populate-if-known set to a minimal set, others may be marked as SHOULD-populate or MAY-populate. In addition, the specification should be explicit on what fields are to be made editable in the UI. Reducing that set to a set is feasible and implementable.

## Implementation Status

**Status**: Pending Decision  
**GitHub Evidence**: None reported  
**Related Tickets**: [[Block-Vote-3]]  

## Disposition Analysis

### Current State
- Ticket Status: **Resolved - No Change**
- Resolution: **Retracted**
- Classification: **Pending Decision**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Resolved - No Change and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Resolved - No Change → Awaiting Governance Review*  
