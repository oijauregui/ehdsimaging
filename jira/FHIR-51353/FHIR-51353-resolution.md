# Proposed Resolution for FHIR-51353

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-51353 |
| Issue Type | Change Request |
| Summary | ImagingStudy Profile: Performer Code not in ValueSet |
| Status | Triaged |
| Resolution | Unresolved |
| Related Artifacts | IM Imaging Study [deprecated] |
| Reporter | Bas van den Heuvel |
| Assignee | Unassigned |
| Created | 6/30/25 |


## Description

src: https://github.com/hl7-eu/imaging/issues/50
 
For ImagingStudy.series.performer a slice was defined including a ValueSet binding to ImImagingStudyPerformerTypeVS :
 {{* series

	performer.function from ImImagingStudyPerformerTypeVS (extensible)
	performer
	insert SliceElement( #type, actor )
	performer contains performer 0..1 and device 0..1 and custodian 0..1
	performer&#91;performer&#93;
	function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PRF
	actor only Reference( http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu )
	performer&#91;custodian&#93;
	function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#CST
	actor only Reference( http://hl7.eu/fhir/base/StructureDefinition/organization-eu )
	performer&#91;device&#93;
	function = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#DEV
	actor only Reference( ImImagingDevice}}
 
However, the code used for performer=device "DEV" is not part of that valueSet yet:
https://build.fhir.org/ig/hl7-eu/imaging/branches/connecthaton39/ValueSet-im-imaging-study-performer-type.html

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
