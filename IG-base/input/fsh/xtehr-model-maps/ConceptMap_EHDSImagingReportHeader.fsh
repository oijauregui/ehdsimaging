////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSImagingReportHeaderMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSImagingReportHeader"
Description: "Map for EHDSImagingReportHeader"
* status = #draft
* experimental = true
* title = "EHDSImagingReportHeader Mapping"
* name = "EHDSImagingReportHeaderMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImCompositionUrl
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "A.1.1 - Subject"
      * relationship = #related-to
  * element[+]
    * code = #healthInsuranceAndPaymentInformation
    * target[+]
      * code = #extension[basedOn]
      * display = "A.1.4 - Health insurance and payment information"
      * relationship = #related-to
  * element[+]
    * code = #intendedRecipient
    * target[+]
      * code = #extension[informationRecipient]
      * display = "A.1.5 - Intended recipient"
      * relationship = #related-to
  * element[+]
    * code = #authorship
    * target[+]
      * code = #author
      * display = "A.1.6 - Authorship"
      * relationship = #related-to
  * element[+]
    * code = #authorship.author
    * target[+]
      * code = #author[author]
      * display = "A.1.6.1 - Author"
      * relationship = #related-to
    * target[+]
      * code = #author[authoringDevice]
      * comment = "not an exact match"
      * display = "A.1.6.1 - Author"
      * relationship = #related-to
  * element[+]
    * code = #authorship.datetime
    * target[+]
      * code = #date
      * display = "A.1.6.2 - DateTime"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #attestation
    * target[+]
      * code = #attester[resultValidator]
      * display = "A.1.7 - Attestation"
      * relationship = #related-to
  * element[+]
    * code = #attestation.attester
    * target[+]
      * code = #attester[resultValidator].party
      * display = "A.1.7.1 - Attester"
      * relationship = #related-to
  * element[+]
    * code = #attestation.datetime
    * target[+]
      * code = #attester[resultValidator].time
      * display = "A.1.7.2 - DateTime"
      * relationship = #related-to
  * element[+]
    * code = #legalAuthentication
    * target[+]
      * code = #attester[legalAuthenticator]
      * display = "A.1.8 - Legal authentication"
      * relationship = #related-to
  * element[+]
    * code = #legalAuthentication.legalAuthenticator
    * target[+]
      * code = #attester[legalAuthenticator].party
      * display = "A.1.8.1 - Legal authenticator"
      * relationship = #related-to
  * element[+]
    * code = #legalAuthentication.datetime
    * target[+]
      * code = #attester[legalAuthenticator].time
      * display = "A.1.8.2 - DateTime"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata
    * noMap = true
  * element[+]
    * code = #documentMetadata.documentId
    * target[+]
      * code = #identifier
      * display = "A.1.9.1 - Document ID"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentType
    * target[+]
      * code = #category[imaging]
      * display = "A.1.9.2 - Document type"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentStatus
    * target[+]
      * code = #status
      * comment = "See mapping between DR status and Composition"
      * display = "A.1.9.3 - Document status"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.period
    * target[+]
      * code = #event.period
      * display = "A.1.9.4 - Period"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.reportDateAndTime
    * target[+]
      * code = #date
      * display = "A.1.9.5 - Report date and time"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentTitle
    * target[+]
      * code = #title
      * display = "A.1.9.6 - Document title"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.eventType
    * target[+]
      * code = #event[imagingstudy]
      * comment = "modality"
      * display = "A.1.9.7 - Event type"
      * relationship = #related-to
    * target[+]
      * code = #event[procedure]
      * comment = "study type"
      * display = "A.1.9.7 - Event type"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.specialty
    * target[+]
      * code = #event[procedure]
      * display = "A.1.9.8 - Specialty"
      * relationship = #related-to
    * target[+]
      * code = #event[imagingstudy]
      * display = "A.1.9.8 - Specialty"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.reportCustodian
    * target[+]
      * code = #custodian
      * display = "A.1.9.9 - Report custodian"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentFormat
    * target[+]
      * code = #type
      * comment = "Could be extended with list of approved templates as a separate category in the future."
      * display = "A.1.9.10 - Document format"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.confidentiality
    * target[+]
      * code = #meta.security
      * display = "A.1.9.11 - Confidentiality"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.language
    * target[+]
      * code = #language
      * display = "A.1.9.12 - Language"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.version
    * target[+]
      * code = #version
      * display = "A.1.9.13 - Version"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.studyInstanceUid
    * target[+]
      * code = #event[imagingstudy]
      * display = "A.1.9.14 - Study Instance UID"
      * relationship = #related-to
    * target[+]
      * code = #section[imagingstudy].entry[imagingstudy]
      * display = "A.1.9.14 - Study Instance UID"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.accessionNumber
    * target[+]
      * code = #extension[basedOn]
      * display = "A.1.9.15 - Accession number"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImDiagnosticReportUrl
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "A.1.1 - Subject"
      * relationship = #related-to
  * element[+]
    * code = #healthInsuranceAndPaymentInformation
    * target[+]
      * code = #basedOn
      * display = "A.1.4 - Health insurance and payment information"
      * relationship = #related-to
  * element[+]
    * code = #authorship.author
    * target[+]
      * code = #performer[author]
      * display = "A.1.6.1 - Author"
      * relationship = #related-to
  * element[+]
    * code = #authorship.datetime
    * target[+]
      * code = #issued
      * display = "A.1.6.2 - DateTime"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentId
    * target[+]
      * code = #identifier
      * display = "A.1.9.1 - Document ID"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentType
    * target[+]
      * code = #category[imaging]
      * display = "A.1.9.2 - Document type"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentStatus
    * target[+]
      * code = #status
      * display = "A.1.9.3 - Document status"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.period
    * target[+]
      * code = #effectivePeriod
      * display = "A.1.9.4 - Period"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImOrderUrl
  * element[+]
    * code = #healthInsuranceAndPaymentInformation
    * target[+]
      * code = #insurance
      * display = "A.1.4 - Health insurance and payment information"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.accessionNumber
    * target[+]
      * code = #identifier[accessionNumber]
      * display = "A.1.9.15 - Accession number"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImProcedureUrl
  * element[+]
    * code = #documentMetadata.eventType
    * target[+]
      * code = #location
      * display = "A.1.9.7 - Event type"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.specialty
    * target[+]
      * code = #location
      * display = "A.1.9.8 - Specialty"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImImagingStudyUrl
  * element[+]
    * code = #documentMetadata.eventType
    * target[+]
      * code = #series.modality
      * display = "A.1.9.7 - Event type"
      * relationship = #related-to
    * target[+]
      * code = #modality
      * display = "A.1.9.7 - Event type"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.specialty
    * target[+]
      * code = #location
      * display = "A.1.9.8 - Specialty"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.studyInstanceUid
    * target[+]
      * code = #identifier[studyInstanceUid]
      * display = "A.1.9.14 - Study Instance UID"
      * relationship = #related-to

////////////////////////////////////////////////////
