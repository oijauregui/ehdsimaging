# Proposed Resolution for FHIR-51333

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51333 |
| Issue Type | Change Request |
| Summary | Should Images Still be Included in the Manifest if No Endpoint is Available, to Inform that the Imaging Occurred and for Out-of-Band Follow-up? |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | Manifest obligations for ImImagingStudyManifest [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/29/25 |

**Related:**
- Grouping: [manifest]


## Description

Manifest obligations for ImImagingStudy - HL7 Europe Imaging Study Report v0.1.0-ballot

This profile lists that both the IID and WADO-RS endpoints are optional. Should ImagingStudies be returned in the manifest if there is no endpoint available (or if the Endpoint has a status indicating that images cannot be immediately obtained)?
We would suggest that they should still be returned if known so that users can follow up out of band if needed. Providing the fuller clinical picture improves care outcomes, and alerts clinicians to the potential need for follow up. 


Note that it is very common for PACS systems to archive some data to long term storage, which may lead to long response times or images being unavailable. In this scenario, even if the link isn't available, ImagingStudy metadata is useful.

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
