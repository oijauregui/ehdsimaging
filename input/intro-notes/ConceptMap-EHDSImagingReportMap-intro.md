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
class ImComposition{
  <<FHIR>>
  section
  section[comparison].entry[study]
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
class ImImagingStudy {
  <<FHIR>>
}
class ImImagingSelection {
  <<FHIR>>
}
class EuDocumentReference {
  <<FHIR>>
}
EHDSImagingReport --> ImComposition
ImComposition --> ImImagingStudy : section[comparison].entry[study]
ImComposition --> ImImagingSelection : section[comparison].entry[study]
ImComposition --> EuDocumentReference : section[comparison].entry[study]
EHDSImagingReport --> ImDiagnosticReport
ImDiagnosticReport --> EuDocumentReference : media
EHDSImagingReport --> ImFinding
ImFinding --> ImImagingStudy : derivedFrom
ImFinding --> ImImagingSelection : derivedFrom
ImFinding --> EuDocumentReference : derivedFrom
EHDSImagingReport --> ImImagingStudy
```

