{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSReportHeader {
  <<XtEHR dataset>>
  subject
  healthInsuranceAndPaymentInformation
  healthInsuranceAndPaymentInformation.healthInsuranceCode
  healthInsuranceAndPaymentInformation.healthInsuranceName
  healthInsuranceAndPaymentInformation.healthInsuranceNumber
  intendedRecipient[x]
  authorship
  authorship.author
  authorship.datetime
  attestation
  attestation.attester
  attestation.datetime
  legalAuthentication
  legalAuthentication.legalAuthenticator
  legalAuthentication.datetime
  documentMetadata
  documentMetadata.documentId
  documentMetadata.documentType
  documentMetadata.documentStatus
  documentMetadata.period
  documentMetadata.reportDateAndTime
  documentMetadata.documentTitle
  documentMetadata.eventType
  documentMetadata.specialty
  documentMetadata.reportCustodian
  documentMetadata.documentFormat
  documentMetadata.confidentiality
  documentMetadata.language
  documentMetadata.version
  documentMetadata.presentedForm
  documentMetadata.media
}
link EHDSReportHeader "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSReportHeader.html"
class ImDiagnosticReport{
  <<FHIR>>
  media
}

EHDSReportHeader --> ImDiagnosticReport
```

