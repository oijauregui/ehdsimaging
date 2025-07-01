# FHIR IG R5 to R4 Migration: Resource-Feature Mapping

This document lists the features that were specifically migrated to FHIR R4 in the Imaging IG. Only features that are under R4-specific tags or code blocks are included, so reviewers can focus on the migrated content.

---

## ImAdverseEvent
- **subject**: R4-specific reference types (ResearchSubject omitted in R4)
- **suspectEntity[procedure].instance**: element name change for R4
- **subjectMedicalHistory**: new element in R4 to encode what is contributingFactor in R5

## ImComposition
- **identifier**: Cardinality is 1..1 in R4 (vs 1..* in R5)
- **event[imagingstudy].detail**: R4 uses `Reference(ImImagingStudy)` instead of CodeableReference
- **event[procedure].detail**: R4 uses `Reference(ImProcedure)` instead of CodeableReference

## ImDiagnosticReport
- **supportingInfo**: cross-version extension for R4
- **composition**: cross-version extension for R4
- **imagingStudy**: R4 uses `imagingStudy` element (vs `study` in R5)
- **supportingInfo/procedure**: procedure slice on supportingInfo in R4

## ImImageIidViewerEndpoint
- **connectionType**: R4 uses direct assignment (vs slicing in R5)
- **payloadType/payloadMimeType**: R4 uses `payloadType` and `payloadMimeType` (vs `payload` and `mimeType` in R5)

## ImWadoEndpoint
- **connectionType**: R4 uses direct assignment
- **payloadType/payloadMimeType**: R4 uses `payloadType` and `payloadMimeType` with explicit cardinalities and slicing

## ImImagingSelection
- **Parent**: R4 uses `Basic` and ImagingSelection cross-version extension
- **extension[imagingSelection]**: R4-specific extension for derivedFrom and other elements

## ImSrInstanceImagingSelection
- **identifier**: R4-specific slicing for sopInstanceUid
- **extension[imagingSelection].extension[studyUid/seriesUid/instance]**: R4-specific extensions for DICOM SR instance referencing

## ImGestationalAgeObservation
- **valueQuantity**: R4 does not have the additional binding present in R5 (TBD: add if needed)

## ImReportIheMhdDocumentReference
- **content ^extension[$cvDocumentReference-content-profile][+].extension[value[x]].valueCanonical**: R4-only extension to backport the R5 `profile` element
- **extension[modality]**: R4-specific extension to backport the R5 `modality` element
- **extension[bodySite]**: R4-specific extension to backport the R5 `bodySite` element
- **extension contains $cvDocumentReferenceBodySite and $cvDocumentReferenceModality**: R4-only extensions defined for `bodySite` and `modality` on DocumentReference
- **Parent: ImIheMhdDocumentReference**: R4-specific parent profile for cross-version compatibility
- TBD: integrate obligations with the script and remove them from the profile

## ImManifestIheMhdDocumentReference
- **content ^extension[$cvDocumentReference-content-profile][+].extension[value[x]].valueCanonical**: R4-only extension to backport the R5 `profile` element
- **extension[modality]**: R4-specific extension to backport the R5 `modality` element
- **extension[bodySite]**: R4-specific extension to backport the R5 `bodySite` element
- **extension contains $cvDocumentReferenceBodySite and $cvDocumentReferenceModality**: R4-only extensions defined for `bodySite` and `modality` on DocumentReference
- **Parent: ImIheMhdDocumentReference**: R4-specific parent profile for cross-version compatibility

## ImIheMhdDocumentReference
- **extension contains $cvDocumentReferenceBodySite and $cvDocumentReferenceModality**: R4-only extensions for bodySite and modality

## ImKeyImageDocumentReference
- **extension[modality]**: R4-specific extension for modality
- **extension[basedOn]**: R4-specific extension for basedOn reference to `ImOrder`
- **Extension: CvDocumentReferenceBasedOn**: R4-only extension for backporting R5's `basedOn`

## ImKeyImageImagingSelection
- **extension[imagingSelection].extension**: R4-specific slicing and performer structure

## ImOrder
- **supportingInfo**: R4-specific extension for pregnancy status
- **extension[reason]**: R4-only extension for ServiceRequest.reason
- **Extension: CvServiceRequestReason and CvServiceRequestSupportingInfoCodeableConcept**: R4-only extensions

## ImImagingDevice
- **extension contains $cvDevice-category named category**: R4-specific extension to represent the `category` element, which is native in R5
- **extension[category] slicing and value**: R4-specific slicing and assignment for the imaging category using extensions
- **Mapping: deviceName**: R4 uses `deviceName` (vs `name` in R5) for mapping DICOM StationName/ManufacturerModelName