{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSHospitalDischargeReport {
  <<XtEHR dataset>>
  hospitalDischargeReportHeader
  presentedForms
  hospitalDischargeReportAttachments[x]
}
class ImDiagnosticReport{
  presentedForm
  media
}

EHDSHospitalDischargeReport --> ImDiagnosticReport
ImDiagnosticReport --> DocumentReference : media
```

