////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSImagingReportBodyMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSImagingReportBody"
Description: "Map for EHDSImagingReportBody"
* status = #draft
* experimental = true
* title = "EHDSImagingReportBody Mapping"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImComposition"
  * element[+]
    * code = #orderInformation
    * target[+]
      * code = #section[order]
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderId
    * target[+]
      * code = #section[order].text
      * relationship = #related-to
    * target[+]
      * code = #identifier
      * relationship = #related-to
    * target[+]
      * code = #section[order].entry[order]
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderDateAndTime
    * target[+]
      * code = #section[order].text
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderPlacer
    * target[+]
      * code = #section[order].text
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderReasonText
    * target[+]
      * code = #section[order].text
      * relationship = #related-to
    * target[+]
      * code = #reason.concept.text
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderReason
    * target[+]
      * code = #section[order].text
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.clinicalQuestion
    * target[+]
      * code = #section[order].text
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * comment = "elements from patient history relevant for the report."
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #orderInformation.supportingInformation.observation
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.condition
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.medicationAdministration
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.devices
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.pregnancyStatus
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.gestationalAge
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.sexForClinicalUse
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.otherSupportingInformation
    * target[+]
      * code = #section[history].text
      * relationship = #related-to
    * target[+]
      * code = #section[history].entry
      * relationship = #related-to
  * element[+]
    * code = #specimen
    * target[+]
      * code = #section[study].text
      * relationship = #related-to
  * element[+]
    * code = #serviceRequest
    * target[+]
      * code = #section[order].entry[order]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.modality
    * target[+]
      * code = #section[procedure].text
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.imagingProcedures
    * target[+]
      * code = #section[procedure].text
      * relationship = #related-to
    * target[+]
      * code = #section[procedure].entry[procedure]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.medication
    * target[+]
      * code = #section[procedure].text
      * relationship = #related-to
    * target[+]
      * code = #section[procedure].entry[procedure]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.adverseReaction
    * target[+]
      * code = #section[procedure].text
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.resultData
    * target[+]
      * code = #section[findings]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.resultData.resultText
    * target[+]
      * code = #section[findings].extension[note]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.resultData.observationResults
    * target[+]
      * code = #section[findings].entry[ImFinding]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.conclusion
    * target[+]
      * code = #section[impression]
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.conclusion.impression
    * target[+]
      * code = #section[impression].extension[note]
      * relationship = #related-to
    * target[+]
      * code = #conclusion
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.conclusion.conditionOrFinding[x]
    * target[+]
      * code = #section[impression].entry[ImImpression]
      * relationship = #related-to
    * target[+]
      * code = #section[impression].entry[ImFinding]
      * relationship = #related-to
  * element[+]
    * code = #recommendation
    * target[+]
      * code = #section[recommendation]
      * relationship = #related-to
  * element[+]
    * code = #recommendation.description
    * target[+]
      * code = #section[recommendation].extension[note]
      * relationship = #related-to
  * element[+]
    * code = #recommendation.carePlan
    * target[+]
      * code = #section[recommendation].entry[careplan]
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImOrder"
  * element[+]
    * code = #orderInformation.orderDateAndTime
    * target[+]
      * code = #authoredOn
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderReason
    * target[+]
      * code = #reason.concept
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.clinicalQuestion
    * target[+]
      * code = #reason.concept
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation
    * target[+]
      * code = #supportingInfo.reference
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.observation
    * target[+]
      * code = #supportingInfo
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.condition
    * target[+]
      * code = #supportingInfo
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.medicationAdministration
    * target[+]
      * code = #reason
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.devices
    * target[+]
      * code = #supportingInfo
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.pregnancyStatus
    * target[+]
      * code = #supportingInfo
      * relationship = #related-to
  * element[+]
    * code = #serviceRequest
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "imOrder"
  * element[+]
    * code = #orderInformation.orderPlacer
    * target[+]
      * code = #practitioner
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImGestationalAgeObservation"
  * element[+]
    * code = #orderInformation.supportingInformation.gestationalAge
    * target[+]
      * code = #valueQuantity
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImPatient"
  * element[+]
    * code = #orderInformation.supportingInformation.sexForClinicalUse
    * target[+]
      * code = #extension[sexParameterForClinicalUse]
      * relationship = #related-to
    * target[+]
      * code = #extension[sexParameterForClinicalUse].value
      * relationship = #related-to
    * target[+]
      * code = #extension[sexParameterForClinicalUse].period
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImImagingStudy"
  * element[+]
    * code = #specimen
    * target[+]
      * code = #series.specimen
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.modality
    * target[+]
      * code = #series.modality
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.bodyPart.bodyLocation
    * target[+]
      * code = #series.bodySite
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.bodyPart.laterality
    * target[+]
      * code = #series.bodySite
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImRadiationDoseObservation"
  * element[+]
    * code = #exposureInformation
    * noMap = true
  * element[+]
    * code = #exposureInformation.effectiveDose
    * target[+]
      * code = #component.value
      * relationship = #related-to
  * element[+]
    * code = #exposureInformation.equivalentDoseInformation
    * target[+]
      * code = #component.value
      * relationship = #related-to
  * element[+]
    * code = #exposureInformation.equivalentDoseInformation.equivalentDose
    * target[+]
      * code = #component.value
      * relationship = #related-to
  * element[+]
    * code = #exposureInformation.equivalentDoseInformation.tissueType
    * target[+]
      * code = #bodySite
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "BodyStructure"
  * element[+]
    * code = #examinationReport.bodyPart.bodyLocation
    * target[+]
      * code = #series.bodySite
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.bodyPart.laterality
    * target[+]
      * code = #includedStructure.laterality
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImMedicationAdministration"
  * element[+]
    * code = #examinationReport.medication
    * target[+]
      * code = #partOf
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImAdverseEvent"
  * element[+]
    * code = #examinationReport.adverseReaction
    * target[+]
      * code = #supectEntity[procedure]
      * relationship = #related-to
    * target[+]
      * code = #contributingFactor[allery]
      * relationship = #related-to
    * target[+]
      * code = #status
      * relationship = #related-to
    * target[+]
      * code = #actuality
      * relationship = #related-to
    * target[+]
      * code = #code
      * relationship = #related-to
    * target[+]
      * code = #subject
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "EuAllergyIntolerance"
  * element[+]
    * code = #examinationReport.adverseReaction
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "ImDiagnosticReport"
  * element[+]
    * code = #examinationReport.resultData.observationResults
    * target[+]
      * code = #result
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = "imComposition"
  * element[+]
    * code = #comparisonStudy
    * target[+]
      * code = #section[comparison].entry[study]
      * relationship = #related-to

////////////////////////////////////////////////////
