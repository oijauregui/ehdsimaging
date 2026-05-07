# Proposed Resolution for FHIR-51013

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51013 |
| Issue Type | Change Request |
| Summary | don't use imaging manifest |
| Status | Resolved - No Change |
| Resolution | Not Persuasive |
| Reporter | Rene Spronk |
| Assignee | Unassigned |
| Created | 5/30/25 |

**Related:**
- Grouping: [Block-Vote-2]


## Description

Note: I'm not an imaging vendor, so I'm looking at this from the HL7 side of things.

There's a lot of discussion about having a separate ImagingManifest or not, and I appreciate it that the discussion was included in the specification. 

The EHDS requirement is for a imaging report, so to me the manifest seems overkill - something that would definitely be of value in the order management part of the workflow (which is, and likley will be for the near future, out of scope for EHDS), but I'm not too sure it adds a lot of value from the reporting side. From a report-consumer side you really don't want a 2-step process. If you really want to include location URLs then there should be a way to reference Endpoints from the report.

## Implementation Status

**Status**: Pending Decision  
**GitHub Evidence**: None reported  
**Related Tickets**: [[Block-Vote-2]]  

## Disposition Analysis

### Current State
- Ticket Status: **Resolved - No Change**
- Resolution: **Not Persuasive**
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
