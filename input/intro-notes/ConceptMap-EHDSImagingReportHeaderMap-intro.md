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
  extension[diagnosticreport-reference]
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
  status
  event.period
  title
  event[imagingstudy]
  event[procedure]
  custodian
  type
  meta.security
  language
  version
  section[imagingstudy].entry[imagingstudy]
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

class ImOrder{
  <<FHIR>>
  insurance
  identifier[accessionNumber]
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

class ImDiagnosticReport {
  <<FHIR>>
}
class EuPatient {
  <<FHIR>>
}
class ImOrder {
  <<FHIR>>
}
class EuPractitionerRole {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
class ImImagingStudy {
  <<FHIR>>
}
class ImProcedure {
  <<FHIR>>
}
class EuOrganization {
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
class EuLocation {
  <<FHIR>>
}
EHDSImagingReportHeader --> ImComposition
ImComposition --> ImDiagnosticReport : extension[diagnosticreport-reference]
ImComposition --> EuPatient : subject
ImComposition --> ImOrder : extension[basedOn]
ImComposition --> EuPractitionerRole : author
ImComposition --> EuDevice : author[author]
ImComposition --> EuPractitionerRole : author[authoringDevice]
ImComposition --> EuPractitionerRole : attester[resultValidator].party
ImComposition --> EuPractitionerRole : attester[legalAuthenticator].party
ImComposition --> ImImagingStudy : event[imagingstudy]
ImComposition --> ImProcedure : event[procedure]
ImComposition --> EuOrganization : custodian
ImComposition --> ImImagingstudy : event[imagingstudy]
ImComposition --> ImImagingstudy : section[imagingstudy].entry[imagingstudy]
EHDSImagingReportHeader --> ImDiagnosticReport
ImDiagnosticReport --> ImComposition : composition
ImDiagnosticReport --> EuPatient : subject
ImDiagnosticReport --> ImOrder : basedOn
ImDiagnosticReport --> EuPractitionerRole : performer[author]
EHDSImagingReportHeader --> ImOrder
ImOrder --> EuCoverage : insurance
EHDSImagingReportHeader --> ImProcedure
ImProcedure --> EuLocation : location
EHDSImagingReportHeader --> ImImagingStudy
```

