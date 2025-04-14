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
      * relationship = #related-to
  * element[+]
    * code = #healthInsuranceAndPaymentInformation
    * target[+]
      * code = #extension[basedOn]
      * relationship = #related-to
  * element[+]
    * code = #intendedRecipient
    * target[+]
      * code = #extension[informationRecipient]
      * relationship = #related-to
  * element[+]
    * code = #authorship
    * target[+]
      * code = #author
      * relationship = #related-to
  * element[+]
    * code = #authorship.author
    * target[+]
      * code = #author[author]
      * relationship = #related-to
    * target[+]
      * code = #author[authoringDevice]
      * comment = "not an exact match"
      * relationship = #related-to
  * element[+]
    * code = #authorship.datetime
    * target[+]
      * code = #date
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #attestation
    * target[+]
      * code = #attester[resultValidator]
      * relationship = #related-to
  * element[+]
    * code = #attestation.attester
    * target[+]
      * code = #attester[resultValidator].party
      * relationship = #related-to
  * element[+]
    * code = #attestation.datetime
    * target[+]
      * code = #attester[resultValidator].time
      * relationship = #related-to
  * element[+]
    * code = #legalAuthentication
    * target[+]
      * code = #attester[legalAuthenticator]
      * relationship = #related-to
  * element[+]
    * code = #legalAuthentication.legalAuthenticator
    * target[+]
      * code = #attester[legalAuthenticator].party
      * relationship = #related-to
  * element[+]
    * code = #legalAuthentication.datetime
    * target[+]
      * code = #attester[legalAuthenticator].time
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata
    * noMap = true
  * element[+]
    * code = #documentMetadata.documentId
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentType
    * target[+]
      * code = #category[imaging]
      * relationship = #related-to
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentStatus
    * target[+]
      * code = #status
      * comment = "See mapping between DR status and Composition"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.period
    * target[+]
      * code = #event.period
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.reportDateAndTime
    * target[+]
      * code = #date
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentTitle
    * target[+]
      * code = #title
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.eventType
    * target[+]
      * code = #event[imagingstudy]
      * comment = "modality"
      * relationship = #related-to
    * target[+]
      * code = #event[procedure]
      * comment = "study type"
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.specialty
    * target[+]
      * code = #event[procedure]
      * relationship = #related-to
    * target[+]
      * code = #event[imagingstudy]
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.reportCustodian
    * target[+]
      * code = #custodian
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentFormat
    * target[+]
      * code = #category[template/hl7eu-imaging]
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.confidentiality
    * target[+]
      * code = #meta.security
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.language
    * target[+]
      * code = #language
      * relationship = #related-to
    * target[+]
      * code = #extension[additional-language]
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.version
    * target[+]
      * code = #version
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.studyInstanceUid
    * target[+]
      * code = #event[imagingstudy]
      * relationship = #related-to
    * target[+]
      * code = #section[imagingstudy].entry[imagingstudy]
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.accessionNumber
    * target[+]
      * code = #extension[basedOn]
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImDiagnosticReportUrl
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #healthInsuranceAndPaymentInformation
    * target[+]
      * code = #basedOn
      * relationship = #related-to
  * element[+]
    * code = #authorship.author
    * target[+]
      * code = #performer[author]
      * relationship = #related-to
  * element[+]
    * code = #authorship.datetime
    * target[+]
      * code = #issued
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentId
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentType
    * target[+]
      * code = #category[imaging]
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.documentStatus
    * target[+]
      * code = #status
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.period
    * target[+]
      * code = #effectivePeriod
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImOrderUrl
  * element[+]
    * code = #healthInsuranceAndPaymentInformation
    * target[+]
      * code = #insurance
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.accessionNumber
    * target[+]
      * code = #identifier[accessionNumber]
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImProcedureUrl
  * element[+]
    * code = #documentMetadata.eventType
    * target[+]
      * code = #location
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.specialty
    * target[+]
      * code = #location
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportHeader"
  * target = $ImImagingStudyUrl
  * element[+]
    * code = #documentMetadata.eventType
    * target[+]
      * code = #series.modality
      * relationship = #related-to
    * target[+]
      * code = #modality
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.specialty
    * target[+]
      * code = #location
      * relationship = #related-to
  * element[+]
    * code = #documentMetadata.studyInstanceUid
    * target[+]
      * code = #identifier[studyInstanceUid]
      * relationship = #related-to

////////////////////////////////////////////////////
