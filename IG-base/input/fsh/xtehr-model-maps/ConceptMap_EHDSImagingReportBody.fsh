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
* name = "EHDSImagingReportBodyMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImCompositionUrl
  * element[+]
    * code = #orderInformation
    * target[+]
      * code = #section[order]
      * display = "B.1.1 - Order information"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderId
    * target[+]
      * code = #identifier
      * display = "B.1.1.1 - Order Id"
      * relationship = #related-to
    * target[+]
      * code = #section[order].entry[order]
      * display = "B.1.1.1 - Order Id"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderReasonText
    * target[+]
      * code = #section[order].extension[note]
      * display = "B.1.1.4 - Order reason text"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation
    * target[+]
      * code = #section[history].entry
      * comment = "elements from patient history relevant for the report."
      * display = "B.1.1.7 - Supporting information"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #orderInformation.supportingInformation.observation
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.1 - Observation"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.condition
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.2 - Condition"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.medicationAdministration
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.3 - Medication Administration"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.devices
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.4 - Devices"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.pregnancyStatus
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.5 - Pregnancy status"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.gestationalAge
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.6 - Gestational age"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.sexForClinicalUse
    * target[+]
      * code = #subject
      * display = "B.1.1.7.7 - Sex for clinical use"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.otherSupportingInformation
    * target[+]
      * code = #section[history].entry
      * display = "B.1.1.7.8 - Other supporting information"
      * relationship = #related-to
  * element[+]
    * code = #serviceRequest
    * target[+]
      * code = #section[order].entry[order]
      * display = "B.1.3 - Service request"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.imagingProcedures
    * target[+]
      * code = #section[procedure].entry[procedure]
      * display = "B.1.5.3 - Imaging procedures"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.medication
    * target[+]
      * code = #section[procedure].entry[procedure]
      * display = "B.1.5.4 - Medication"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.resultData
    * target[+]
      * code = #section[findings]
      * display = "B.1.5.6 - Result data"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.resultData.resultText
    * target[+]
      * code = #section[findings].extension[note]
      * display = "B.1.5.6.1 - Result text"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.resultData.observationResults
    * target[+]
      * code = #section[findings].entry[ImFinding]
      * display = "B.1.5.6.2 - Observation results"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.conclusion
    * target[+]
      * code = #section[impression]
      * display = "B.1.5.7 - Conclusion"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.conclusion.conditionOrFinding[x]
    * target[+]
      * code = #section[impression].entry[ImFinding]
      * display = "B.1.5.7.2 - Condition or finding"
      * relationship = #related-to
    * target[+]
      * code = #section[impression].entry[impression]
      * display = "B.1.5.7.2 - Condition or finding"
      * relationship = #related-to
  * element[+]
    * code = #recommendation
    * target[+]
      * code = #section[recommendation]
      * display = "B.1.6 - Recommendation"
      * relationship = #related-to
  * element[+]
    * code = #recommendation.carePlan
    * target[+]
      * code = #section[recommendation].entry[careplan]
      * display = "B.1.6.2 - Care plan"
      * relationship = #related-to
  * element[+]
    * code = #comparisonStudy
    * target[+]
      * code = #section[comparison].entry[comparedstudy]
      * display = "B.1.7 - Comparison Study"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImOrderUrl
  * element[+]
    * code = #orderInformation.orderDateAndTime
    * target[+]
      * code = #authoredOn
      * display = "B.1.1.2 - Order date and time"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderPlacer
    * target[+]
      * code = #requester
      * display = "B.1.1.3 - Order placer"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderReasonText
    * target[+]
      * code = #reason.concept.text
      * display = "B.1.1.4 - Order reason text"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.orderReason
    * target[+]
      * code = #reason.concept
      * display = "B.1.1.5 - Order reason"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.clinicalQuestion
    * target[+]
      * code = #reason.concept
      * display = "B.1.1.6 - Clinical question"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation
    * target[+]
      * code = #supportingInfo
      * comment = "Point to observations and conditions"
      * display = "B.1.1.7 - Supporting information"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.observation
    * target[+]
      * code = #supportingInfo
      * comment = "Refer to observations"
      * display = "B.1.1.7.1 - Observation"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.condition
    * target[+]
      * code = #supportingInfo
      * comment = "Refer to conditions"
      * display = "B.1.1.7.2 - Condition"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.medicationAdministration
    * target[+]
      * code = #reason
      * display = "B.1.1.7.3 - Medication Administration"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.devices
    * target[+]
      * code = #supportingInfo
      * comment = "Refer to device, might be replaced by a more constraint reference."
      * display = "B.1.1.7.4 - Devices"
      * relationship = #related-to
  * element[+]
    * code = #orderInformation.supportingInformation.pregnancyStatus
    * target[+]
      * code = #supportingInfo[pregnancy]
      * comment = "Code in supporting info, could be a observation as well"
      * display = "B.1.1.7.5 - Pregnancy status"
      * relationship = #related-to
  * element[+]
    * code = #serviceRequest
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImGestationalAgeObservationUrl
  * element[+]
    * code = #orderInformation.supportingInformation.gestationalAge
    * target[+]
      * code = #value[x]
      * display = "B.1.1.7.6 - Gestational age"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImPatientUrl
  * element[+]
    * code = #orderInformation.supportingInformation.sexForClinicalUse
    * target[+]
      * code = #extension[sex-for-clinical-use]
      * display = "B.1.1.7.7 - Sex for clinical use"
      * relationship = #related-to
    * target[+]
      * code = #extension[sex-for-clinical-use].extension[value].valueCodeableConcept
      * display = "B.1.1.7.7 - Sex for clinical use"
      * relationship = #related-to
    * target[+]
      * code = #extension[sex-for-clinical-use].extension[period].valuePeriod
      * display = "B.1.1.7.7 - Sex for clinical use"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImImagingStudyUrl
  * element[+]
    * code = #specimen
    * target[+]
      * code = #series.specimen
      * display = "B.1.2 - Specimen"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.modality
    * target[+]
      * code = #series.modality
      * display = "B.1.5.1 - Modality"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.bodyPart.bodyLocation
    * target[+]
      * code = #series.bodySite
      * display = "B.1.5.2.1 - Body location"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.bodyPart.laterality
    * target[+]
      * code = #series.bodySite
      * display = "B.1.5.2.2 - Laterality"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImRadiationDoseObservationUrl
  * element[+]
    * code = #exposureInformation
    * noMap = true
  * element[+]
    * code = #exposureInformation.effectiveDose
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "B.1.4.1 - Effective dose"
      * relationship = #related-to
  * element[+]
    * code = #exposureInformation.equivalentDoseInformation
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "B.1.4.2 - Equivalent dose information"
      * relationship = #related-to
  * element[+]
    * code = #exposureInformation.equivalentDoseInformation.equivalentDose
    * target[+]
      * code = #component.value[x]
      * comment = "choose one of the slices"
      * display = "B.1.4.2.1 - Equivalent dose"
      * relationship = #related-to
  * element[+]
    * code = #exposureInformation.equivalentDoseInformation.tissueType
    * target[+]
      * code = #bodySite
      * display = "B.1.4.2.2 - Tissue type"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $EuBodyStructureUrl
  * element[+]
    * code = #examinationReport.bodyPart.bodyLocation
    * target[+]
      * code = #morphology
      * display = "B.1.5.2.1 - Body location"
      * relationship = #related-to
    * target[+]
      * code = #includedStructure.structure
      * display = "B.1.5.2.1 - Body location"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.bodyPart.laterality
    * target[+]
      * code = #includedStructure.laterality
      * display = "B.1.5.2.2 - Laterality"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $EuMedicationAdministrationUrl
  * element[+]
    * code = #examinationReport.medication
    * target[+]
      * code = #partOf
      * display = "B.1.5.4 - Medication"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImAdverseEventUrl
  * element[+]
    * code = #examinationReport.adverseReaction
    * target[+]
      * code = #suspectEntity[procedure]
      * display = "B.1.5.5 - Adverse reaction"
      * relationship = #related-to
    * target[+]
      * code = #contributingFactor[allergy]
      * display = "B.1.5.5 - Adverse reaction"
      * relationship = #related-to
    * target[+]
      * code = #status
      * display = "B.1.5.5 - Adverse reaction"
      * relationship = #related-to
    * target[+]
      * code = #code
      * display = "B.1.5.5 - Adverse reaction"
      * relationship = #related-to
    * target[+]
      * code = #subject
      * display = "B.1.5.5 - Adverse reaction"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $EuAllergyIntoleranceUrl
  * element[+]
    * code = #examinationReport.adverseReaction
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $ImDiagnosticReportUrl
  * element[+]
    * code = #examinationReport.resultData.observationResults
    * target[+]
      * code = #result
      * display = "B.1.5.6.2 - Observation results"
      * relationship = #related-to
  * element[+]
    * code = #examinationReport.conclusion.impression
    * target[+]
      * code = #conclusion
      * display = "B.1.5.7.1 - Impression"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * target = $EuCarePlanUrl
  * element[+]
    * code = #recommendation.description
    * target[+]
      * code = #description
      * display = "B.1.6.1 - Description"
      * relationship = #related-to
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSImagingReportBody"
  * element[+]
    * code = #examinationReport
    * noMap = true
    * display = "(B.1.5 - Examination Report)"
  * element[+]
    * code = #examinationReport.bodyPart
    * noMap = true
    * display = "(B.1.5.2 - Body part)"

////////////////////////////////////////////////////
