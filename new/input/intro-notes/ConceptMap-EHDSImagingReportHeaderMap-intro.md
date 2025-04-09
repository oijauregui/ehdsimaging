{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSImagingReportHeader {
  <<XtEHR dataset>>
  subject
  healthInsuranceAndPaymentInformation
  intendedRecipient
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
  documentMetadata.studyInstanceUid
  documentMetadata.accessionNumber
}
link EHDSImagingReportHeader "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSImagingReportHeader.html"
class ImComposition{
  <<FHIR>>
  extension[diagnosticreport-reference ]
  subject
  extension[basedOn]
  extension[informationRecipient]
  author
  author[author]
  author[authoringDevice]
  date
  attester[resultValidator]
  attester[resultValidator].party
  attester[resultValidator].time
  attester[legalAuthenticator]
  attester[legalAuthenticator].party
  attester[legalAuthenticator].time
  identifier
  category[imaging]
  type
  status
  event.period
  title
  event.detail[study]
  event.detail[procedure]
  custodian
  category[template/hl7eu-imaging]
  meta.security
  language
  extension[additional-language]
  version
  study
}

class ImDiagnosticReport{
  <<FHIR>>
  composition
  subject
  basedOn
  performer[author]
  issued
  identifier
  category[imaging]
  status
  effectivePeriod
}

class ImServiceRequest{
  <<FHIR>>
  insurrance
}

class ImProcedure{
  <<FHIR>>
  location
}

class ImImagingStudy{
  <<FHIR>>
  series.modality
  modality
  location
  identifier[studyInstanceUid]
}

class ImOrder{
  <<FHIR>>
  identifier[accessionNumber]
  extension[basedOn]
}

class ImDiagnosticReport {
  <<FHIR>>
}
class EuPatient {
  <<FHIR>>
}
class ImServiceRequest {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
class ImProcedure {
  <<FHIR>>
}
class ImImagingStudy {
  <<FHIR>>
}
class ImImagingstudy {
  <<FHIR>>
}
class ImComposition {
  <<FHIR>>
}
class EuCoverage {
  <<FHIR>>
}
class LocationEu {
  <<FHIR>>
}
class ImOrder {
  <<FHIR>>
}
EHDSImagingReportHeader --> ImComposition
ImComposition --> ImDiagnosticReport : extension[diagnosticreport-reference ]
ImComposition --> EuPatient : subject
ImComposition --> ImServiceRequest : extension[basedOn]
ImComposition --> EuPractitionerRole : author
ImComposition --> EuDevice : author[author]
ImComposition --> EuPractitionerRole : author[authoringDevice]
ImComposition --> EuPractitionerRole : attester[resultValidator].party
ImComposition --> EuPractitionerRole : attester[legalAuthenticator]
ImComposition --> ImProcedure : event.detail[study]
ImComposition --> ImImagingStudy : event.detail[procedure]
ImComposition --> ImImagingstudy : event.detail[study]
ImComposition --> ImImagingstudy : study
EHDSImagingReportHeader --> ImDiagnosticReport
ImDiagnosticReport --> ImComposition : composition
ImDiagnosticReport --> EuPatient : subject
ImDiagnosticReport --> ImServiceRequest : basedOn
EHDSImagingReportHeader --> ImServiceRequest
ImServiceRequest --> EuCoverage : insurrance
EHDSImagingReportHeader --> ImProcedure
ImProcedure --> LocationEu : location
EHDSImagingReportHeader --> ImImagingStudy
EHDSImagingReportHeader --> ImOrder
ImOrder --> ImOrder : extension[basedOn]
```

