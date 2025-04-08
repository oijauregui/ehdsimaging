{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSImagingReport {
  <<XtEHR dataset>>
  imagingReportHeader
  imagingReportStructuredBody
  presentedForms
  imagingReportAttachments[x]
  dicomStudyMetadata
}
link EHDSImagingReport "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSImagingReport.html"
class Composition{
  <<FHIR>>
  section
}

class DiagnosticReport
class ImDiagnosticReport{
  <<FHIR>>
  presentedForm
  media
}

class ImComposition{
  <<FHIR>>
  section[comparison].entry[study]
}

class ImFinding{
  <<FHIR>>
  derivedFrom
}

class ImImagingStudy
class EuDocumentReference {
  <<FHIR>>
}
class ImImagingStudy {
  <<FHIR>>
}
class ImImagingSelection {
  <<FHIR>>
}
class DocumentReference {
  <<FHIR>>
}
EHDSImagingReport --> Composition
EHDSImagingReport --> DiagnosticReport
EHDSImagingReport --> ImDiagnosticReport
ImDiagnosticReport --> EuDocumentReference : media
EHDSImagingReport --> ImComposition
ImComposition --> ImImagingStudy : section[comparison].entry[study]
ImComposition --> ImImagingSelection : section[comparison].entry[study]
ImComposition --> EuDocumentReference : section[comparison].entry[study]
ImComposition --> DocumentReference : section[comparison].entry[study]
EHDSImagingReport --> ImFinding
ImFinding --> ImImagingStudy : derivedFrom
ImFinding --> ImImagingSelection : derivedFrom
ImFinding --> EuDocumentReference : derivedFrom
ImFinding --> DocumentReference : derivedFrom
EHDSImagingReport --> ImImagingStudy
```

