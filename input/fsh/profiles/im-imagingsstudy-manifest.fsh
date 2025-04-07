Profile: ImImagingStudyManifest
Parent: Bundle
Id: im-imagingstudy-manifest
Title: "ImagingStudy Manifest"
Description: """
This profile represents a manifest of an imaging study. It holds the ImagingStudy resource that mirrors the information in the DICOM study allow with other resources that are required to express the information in DICOM in FHIR.\n
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert PartOfImagingManifest
* entry 
  * insert SliceElement( #value, fullUrl )
* entry 
    contains imagingstudy 1..1  
    and      patient 0..1
    and      order 0..1
    and      endpoint 1..*
    and      imagingdevice 0..*
* entry[imagingstudy]
  * fullUrl 1..1
  * resource 1..1
  * resource only ImManifestImagingStudy
* entry[patient]
  * fullUrl 1..1
  * resource 1..1
  * resource only http://hl7.eu/fhir/base/StructureDefinition/patient-eu
* entry[order]
  * fullUrl 1..1
  * resource 1..1
  * resource only ImOrder
* entry[endpoint]
  * fullUrl 1..1
  * resource 1..1
  * resource only ImWadoEndpoint or ImImageIidViewerEndpoint
* entry[imagingdevice]
  * fullUrl 1..1
  * resource 1..1
  * resource only ImImagingDevice


Profile: ImManifestImagingStudy
Parent: ImImagingStudy
Id: imm-imagingstudy-manifest-imagingstudy
Title: "ImagingStudy study present in an ImagingStudy Manifest"
Description: """
This profile represents an ImagingStudy resource that is present in an ImagingStudy Manifest. It enforces the presence of endpoints.
"""
* insert SetFmmAndStatusRule( 1, draft )
* obeys imm-manifest-imagingstudy-01

Invariant: imm-manifest-imagingstudy-01
Description: "An endpoint must be provided."
Severity: #error
Expression: "endpoint.exists() or series.endpoint.exists()"
