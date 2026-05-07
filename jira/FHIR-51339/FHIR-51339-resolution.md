# Proposed Resolution for FHIR-51339

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51339 |
| Issue Type | Change Request |
| Summary | Imaging Key Image Document Reference “should be a direct URL to the image” |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Imaging Key Image Document Reference [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/29/25 |

**Related:**
- Grouping: [manifest]


## Description

This relates to another ticket we created about the expected architecture and how the authors anticipate that references will be resolved across affiliate domains (https://jira.hl7.org/browse/FHIR-51273)

The text for Imaging Key Image Document Reference specifies that “DocumentReference.content.attachment.url should be a direct URL to the image”.

Does “direct” here mean a fully qualified URL?  

Should record holders anticipate that these would be directly queried by the requesting organization? Should this be “a direct URL accessible to the NCP”?

## Implementation Status

**Status**: Pending Governance Review  
**GitHub Evidence**: None reported  
**Related Tickets**: [[manifest]]  

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
