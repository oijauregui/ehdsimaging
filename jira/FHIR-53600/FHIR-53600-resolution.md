# Proposed Resolution for FHIR-53600

## Ticket Summary

| Field | Value |
|-------|-------|
| Key | FHIR-53600 |
| Issue Type | Change Request |
| Summary | Update Xt-EHR mapping table |
| Status | Resolved - change required |
| Resolution | Persuasive |
| Reporter | IgnacioJauregui |
| Assignee | Unassigned |
| Created | 12/9/25 |


## Description

A number of updates are needed in the mapping table due to ImagingReport IG and  XtEHR model updates. 

Chenges applied here: Xt-EHR mapping - HL7 Europe Imaging Report R5 v0.1.1-build

	mention source TSV file
	Specific mapping target differences
	
		EHDSImagingReport.header.documentType (update slice name )
		
			Current: CompositionEuImaging.category&#91;imaging&#93;; DiagnosticReportEuImaging.category&#91;imaging&#93;
			New: CompositionEuImaging.category&#91;diagnostic-service&#93;; DiagnosticReportEuImaging.category&#91;diagnostic-service&#93;
		
		
		EHDSImagingReport.header.period (resolve to .period, aligning with EUCore)
		
			Current: CompositionEuImaging.event; DiagnosticReportEuImaging.effectivePeriod
			New: CompositionEuImaging.event.period; DiagnosticReportEuImaging.effectivePeriod
		
		
		EHDSImagingReport.header.eventType (EUCore asked for clarification. Not using event anymore, Procedure.location seems wrong)
		
			Current: CompositionEuImaging.event&#91;imagingstudy&#93;; ProcedureEuImaging.location; CompositionEuImaging.event&#91;procedure&#93;; ImagingStudyEuImaging.series; ImagingStudyEuImaging.modality
			New: CompositionEuImaging.category&#91;diagnostic-service&#93;; ProcedureEuImaging.code; ImagingStudyEuImaging.series; ImagingStudyEuImaging.modality
		
		
		EHDSImagingReport.header.documentFormat (applying FHIR-51171 Composition: remove fixed code for type - Jira)
		
			Current: CompositionEuImaging.type
			New: BundleReportEuImagingDocumentReference.content.profile
		
		
		EHDSImagingReport.header.confidentiality (resolve more in detail)
		
			MasterR5: CompositionEuImaging.meta; DiagnosticReportEuImaging.meta
			ForkR5: CompositionEuImaging.meta.security; DiagnosticReportEuImaging.meta.security
		
		
		EHDSImagingReport.header.authorSpecialty, (need to change to ServiceSpecialty -though commented by EUCore. Add DiagnosticReport)
		
			MasterR5: CompositionEuImaging.author&#91;author&#93;
			ForkR5: CompositionEuImaging.author&#91;author&#93;; DiagnosticReportEuImaging.resultIntepreter&#91;author&#93;
		
		
	
	



4. Exposure Information Comment

ForkR5 adds a reference to a GitHub issue:

"Comments in this issue &#91;https://github.com/Xt-EHR/xt-ehr-common/issues/365|vscode-file://vscode-app/c:/Users/320166472/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-browser/workbench/workbench.html&#93;"

## Implementation Status

**Status**: Alternative or Pending  
**GitHub Evidence**: None reported  
**Related Tickets**: None identified  

## Disposition Analysis

### Current State
- Ticket Status: **Resolved - change required**
- Resolution: **Persuasive**
- Classification: **Alternative or Pending**

## Proposed Dispositions

### Disposition A: Accept As Requested

#### Proposal

Review this ticket with the work group to determine if the requested change should be accepted and implemented exactly as described.

#### Justification

The ticket is in status Resolved - change required and presents a specific change request. Work group review is needed to make an informed decision on whether this approach is feasible and aligns with specification goals.

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
*Ticket Status: Resolved - change required → Awaiting Governance Review*  
