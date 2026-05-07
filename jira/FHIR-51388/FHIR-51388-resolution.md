# Proposed Resolution for FHIR-51388

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51388 |
| Issue Type | Change Request |
| Summary | Exchange of Manifest Bundle is Unclear, Perhaps Underscoped |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM ImagingStudy Manifest [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/30/25 |

**Related:**
- Grouping: [manifest]


## Description

IM ImagingStudy Manifest - HL7 Europe Imaging Study Report v0.1.0-ballot

Related to the top-level Manifest Bundle - Which type of bundle is being used here seems under-specified. At first look it appears to not just include a Document-Type bundle with Composition (as Imaging Report and others have used), but also any other bundle type (document | message | transaction | transaction-response | batch | batch-response | history | searchset | collection | subscription-notification, etc).

Requiring manifest providers/consumers to support all of these bundle types is a lot of scope and greatly increases effort. It should be constrained to simplify deployment, and clarified which bundle type should be primarily used to communicate the manifest Bundle (see Document approach below)


This ties in with the use cases and transactions need discussion noted elsewhere in tickets.

Workflow goal here is to offer an interface to search over manifests:

From the single-resource perspective (which is my preference), I would want to do a  FHIR native search on ImagingStudy and get back a SearchSet Bundle as the core FHIR spec defines. I can determine which resources as a client I want with _Include, or follow links in subsequent calls.

From the "document" perspective, how the Manifest should be communicated in a Bundle is a good question. It should be clear (A) which resources should be included in the bundle vs referenced (there's some business logic here) and (B) fit into something like MHD or similar for document exchange.

However, there's less of a need in the manifest for doing a FHIR document with the human-readable composition. Maybe collection or operation type bundle, not sure.

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
