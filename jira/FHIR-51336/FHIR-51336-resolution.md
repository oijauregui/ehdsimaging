# Proposed Resolution for FHIR-51336

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51336 |
| Issue Type | Change Request |
| Summary | Which Resource Artifacts are Individually Query-able, vs Just Included as Logical Models? |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM ImagingStudy Manifest [deprecated] |
| Reporter | JoshPriebe |
| Assignee | Unassigned |
| Created | 6/29/25 |

**Related:**
- Grouping: [manifest]


## Description

The Manifest_ resources all indicate that they are “not used by any profiles in this Implementation Guide” (I think this is text inserted from the IG publisher). We’ve interpreted these as representing ‘data models’, rather than implementable resources (reachable in a query)

We’d suggest further elaboration on how these ‘profiles’ relate to the expected implementable/queryable resources. In addition, the page states that “&#91;t&#93;he manifest is a FHIR bundle that includes the ImagingStudy resource and at least one Endpoint”, while also stating that “&#91;i&#93;n document based deployments, it is the ‘document’ that is searched for and provides URLs that allow download of the imaging content. It is the data that is provide by a PACS system”.

This makes it unclear whether a FHIR document (composition) is expected for the ImagingStudy resources, or if the ImagingStudy resources (which already contain Endpoint information) may be returned as a standard SearchSet bundle. We suggest allowing standard SearchSet bundles to mirror typical FHIR workflows and to reduce implementation time and cost.

Clarifying the query interactions for each artifact and how it they work together is important.

For example:

Document Approach: 
GET {Document URL indexed by MHD DocumentReference}, Receive Document-type bundle conforming to manifest bundle/report bundle. Child models (e.g. Endpoint) have profiles but are not necessarily individually query-able.

Single Research Search: 

GET ImagingStudy/DiagnosticReport, Receive Searchset Bundle conforming to FHIR core.

Here ImagingStudy is directly deployable by itself in native FHIR single-resource search.

It should be separated in the IG which resources are directly tied to these interactions, and which are just downstream data profiles (e.g. the Patient resource in the bundle).

(Not 100% about this, but I think you can separate the deployable profiles from the data model profiles with StructureDefinition.kind = logical / resource)

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
