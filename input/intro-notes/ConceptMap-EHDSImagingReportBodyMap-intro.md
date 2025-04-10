{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSImagingReportBody {
  <<XtEHR dataset>>
  orderInformation
  orderInformation.orderId
  orderInformation.orderDateAndTime
  orderInformation.orderPlacer
  orderInformation.orderReasonText
  orderInformation.orderReason
  orderInformation.clinicalQuestion
  orderInformation.supportingInformation
  orderInformation.supportingInformation.observation
  orderInformation.supportingInformation.condition
  orderInformation.supportingInformation.medicationAdministration
  orderInformation.supportingInformation.devices
  orderInformation.supportingInformation.pregnancyStatus
  orderInformation.supportingInformation.gestationalAge
  orderInformation.supportingInformation.sexForClinicalUse
  orderInformation.supportingInformation.otherSupportingInformation
  specimen
  serviceRequest
  exposureInformation
  exposureInformation.effectiveDose
  exposureInformation.equivalentDoseInformation
  exposureInformation.equivalentDoseInformation.equivalentDose
  exposureInformation.equivalentDoseInformation.tissueType
  examinationReport
  examinationReport.modality
  examinationReport.bodyPart
  examinationReport.bodyPart.bodyLocation
  examinationReport.bodyPart.laterality
  examinationReport.imagingProcedures
  examinationReport.medication
  examinationReport.adverseReaction
  examinationReport.resultData
  examinationReport.resultData.resultText
  examinationReport.resultData.observationResults
  examinationReport.conclusion
  examinationReport.conclusion.impression
  examinationReport.conclusion.conditionOrFinding[x]
  recommendation
  recommendation.description
  recommendation.carePlan
  comparisonStudy
}
link EHDSImagingReportBody "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSImagingReportBody.html"
class ImComposition{
  <<FHIR>>
  section[order]
  section[order].text
  identifier
  section[order].entry[order]
  reason.concept.text
  section[history].text
  section[history].entry
  subject
  section[study].text
  section[procedure].text
  section[procedure].entry[procedure]
  section[findings]
  section[findings].extension[note]
  section[findings].entry[ImFinding]
  section[impression]
  section[impression].extension[note]
  conclusion
  section[impression].entry[ImImpression]
  section[impression].entry[ImFinding]
  section[recommendation]
  section[recommendation].extension[note]
  section[recommendation].entry[careplan]
}

class ImOrder{
  <<FHIR>>
  authoredOn
  reason.concept
  supportingInfo.reference
  supportingInfo
  reason
}

class imOrder{
  <<FHIR>>
  practitioner
}

class ImGestationalAgeObservation{
  <<FHIR>>
  valueQuantity
}

class ImPatient{
  <<FHIR>>
  extension[sexParameterForClinicalUse]
  extension[sexParameterForClinicalUse].value
  extension[sexParameterForClinicalUse].period
}

class ImImagingStudy{
  <<FHIR>>
  series.specimen
  series.modality
  series.bodySite
}

class ImRadiationDoseObservation{
  <<FHIR>>
  component.value
  bodySite
}

class BodyStructure{
  <<FHIR>>
  series.bodySite
  includedStructure.laterality
}

class ImMedicationAdministration{
  <<FHIR>>
  partOf
}

class ImAdverseEvent{
  <<FHIR>>
  supectEntity[procedure]
  contributingFactor[allery]
  status
  actuality
  code
  subject
}

class EuAllergyIntolerance
class ImDiagnosticReport{
  <<FHIR>>
  result
}

class imComposition{
  <<FHIR>>
  section[comparison].entry[study]
}

class ImOrder {
  <<FHIR>>
}
class ConditionEu {
  <<FHIR>>
}
class MedicationAdministrationEu {
  <<FHIR>>
}
class DeviceEu {
  <<FHIR>>
}
class Observation-pregnancy-status-uv-ips {
  <<FHIR>>
}
class ImGestationalAgeObservation {
  <<FHIR>>
}
class ImPatient {
  <<FHIR>>
}
class ImFinding {
  <<FHIR>>
}
class ImImpression {
  <<FHIR>>
}
class EuCarePlan {
  <<FHIR>>
}
class ObservationEu {
  <<FHIR>>
}
class PractitionerRoleEu {
  <<FHIR>>
}
class ImProcedure {
  <<FHIR>>
}
class EuAllergyIntolerance {
  <<FHIR>>
}
class  ImRadiationDoseObservation {
  <<FHIR>>
}
class ImImagingStudy {
  <<FHIR>>
}
EHDSImagingReportBody --> ImComposition
ImComposition --> ImOrder : section[order].entry[order]
ImComposition --> ConditionEu : section[history].entry
ImComposition --> MedicationAdministrationEu : section[history].text
ImComposition --> DeviceEu : section[history].entry
ImComposition --> Observation-pregnancy-status-uv-ips : section[history].entry
ImComposition --> ImGestationalAgeObservation : section[history].entry
ImComposition --> ImPatient : subject
ImComposition --> ImFinding : section[findings].entry[ImFinding]
ImComposition --> ImFinding : section[impression].entry[ImImpression]
ImComposition --> ImImpression : section[impression].entry[ImFinding]
ImComposition --> EuCarePlan : section[recommendation].entry[careplan]
EHDSImagingReportBody --> ImOrder
ImOrder --> ObservationEu : supportingInfo.reference
EHDSImagingReportBody --> imOrder
imOrder --> PractitionerRoleEu : practitioner
EHDSImagingReportBody --> ImGestationalAgeObservation
EHDSImagingReportBody --> ImPatient
EHDSImagingReportBody --> ImImagingStudy
EHDSImagingReportBody --> ImRadiationDoseObservation
EHDSImagingReportBody --> BodyStructure
EHDSImagingReportBody --> ImMedicationAdministration
ImMedicationAdministration --> ImProcedure : partOf
EHDSImagingReportBody --> ImAdverseEvent
ImAdverseEvent --> ImProcedure : supectEntity[procedure]
ImAdverseEvent --> EuAllergyIntolerance : contributingFactor[allery]
EHDSImagingReportBody --> EuAllergyIntolerance
EHDSImagingReportBody --> ImDiagnosticReport
ImDiagnosticReport --> ImFinding : result
ImDiagnosticReport -->  ImRadiationDoseObservation : result
EHDSImagingReportBody --> imComposition
imComposition --> ImImagingStudy : section[comparison].entry[study]
```

