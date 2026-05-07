# Proposed Resolution for FHIR-51296

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51296 |
| Issue Type | Change Request |
| Summary | Clarify the Expectations for IID vs WADO Endpoints |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM Image Viewer Endpoint [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/27/25 |

**Related:**
- Grouping: [manifest]


## Description

This guide specifies both WADO-RS and IID endpoints (although both are optional). Is there guidance for when each should be used, and is one expected as the minimum to support? Allowing both has the potential to double consumer costs to get complete coverage of source implementations.

WADO-RS and IID have potentially substantial differences in workflow, auth/access, provenance, etc. Creating clearer expectations here could save the implementer community significant development, and helping to create alignment could save implementation time and cost. 

For most of the workflows described, and depending on the wider architectural question of how references may be resolved across affiliate domains, we believe WADO-RS endpoints should be preferred if available. This can support both the Radiologist Overread workflow (by providing full diagnostic quality images), comparison studies, and key images. It can also support wiewers deployed at the local level, which we expect to be the preference for many providers.

Additionally, deploying IID Endpoints in a cross-border setting introduces additional challenges: 
(1) Localization: If I'm deploying a Spanish-language viewer cross-border, either all receivers need to understand Spanish or I need to support ALL possible destination locales. 
(2) Access and authorization: Sending all the client &lt;&gt; server viewer traffic through the NCP connections is more challenging compared to an API such as WADO-RS. Going direct could be better but multiplies the access possibilities for servers. 
(3) Usability. From an image access consumer perspective, I don't want 26 different viewers from 26 countries. I probably want the locally deployed viewer I'm familiar with and use for other workflows.

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
