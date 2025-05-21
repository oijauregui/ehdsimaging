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
class ImReport{
  <<FHIR>>
  entry[imComposition]
  entry[imDiagnosticReport]
}

class ImComposition{
  <<FHIR>>
  section[comparison].entry[comparedstudy]
}

class ImDiagnosticReport{
  <<FHIR>>
  presentedForm
  media
}

class ImFinding{
  <<FHIR>>
  derivedFrom
}

class ImImagingStudy
class ImImagingStudyManifest{
  <<FHIR>>
  entry[imagingstudy]
}

class ImComposition {
  <<FHIR>>
}
class ImDiagnosticReport {
  <<FHIR>>
}
class ImImagingStudy {
  <<FHIR>>
}
class ImImagingSelection {
  <<FHIR>>
}
class EuDocumentReference {
  <<FHIR>>
}
EHDSImagingReport --> ImReport
ImReport --> ImComposition : entry[imComposition]
ImReport --> ImDiagnosticReport : entry[imDiagnosticReport]
EHDSImagingReport --> ImComposition
ImComposition --> ImImagingStudy : section[comparison].entry[comparedstudy]
ImComposition --> ImImagingSelection : section[comparison].entry[comparedstudy]
ImComposition --> EuDocumentReference : section[comparison].entry[comparedstudy]
EHDSImagingReport --> ImDiagnosticReport
ImDiagnosticReport --> EuDocumentReference : media
EHDSImagingReport --> ImFinding
ImFinding --> ImImagingStudy : derivedFrom
ImFinding --> ImImagingSelection : derivedFrom
ImFinding --> EuDocumentReference : derivedFrom
EHDSImagingReport --> ImImagingStudy
EHDSImagingReport --> ImImagingStudyManifest
```

