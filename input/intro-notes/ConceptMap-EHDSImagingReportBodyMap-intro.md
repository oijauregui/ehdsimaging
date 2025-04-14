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
  section[comparison].entry[study]
}

class ImOrder{
  <<FHIR>>
  authoredOn
  requester
  reason.concept
  supportingInfo
  reason
  supportingInfo[pregnacy]
}

class ImGestationalAgeObservation{
  <<FHIR>>
  valueQuantity
}

class ImPatient{
  <<FHIR>>
  extension[sexParameterForClinicalUse]
  extension[sexParameterForClinicalUse].extension[value].valueCodeableConcept
  extension[sexParameterForClinicalUse].extension[period].valuePeriod
}

class ImImagingStudy{
  <<FHIR>>
  series.specimen
  series.modality
  series.bodySite
}

class ImRadiationDoseObservation{
  <<FHIR>>
  component.value[x]
  bodySite
}

class EuBodyStructure{
  <<FHIR>>
  morphology
  includedStructure.structure
  includedStructure.laterality
}

class EuMedicationAdministration{
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
  suspectEntity[procedure]
}

class EuAllergyIntolerance
class ImDiagnosticReport{
  <<FHIR>>
  result
}

class ImOrder {
  <<FHIR>>
}
class ConditionEu {
  <<FHIR>>
}
class EuMedicationAdministration {
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
class ImImagingStudy {
  <<FHIR>>
}
class PractitionerRoleEu {
  <<FHIR>>
}
class EuCondition {
  <<FHIR>>
}
class  EuObservation {
  <<FHIR>>
}
class EuObservation {
  <<FHIR>>
}
class EuDevice {
  <<FHIR>>
}
class EuSpecimen {
  <<FHIR>>
}
class EuBodyStructure {
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
EHDSImagingReportBody --> ImComposition
ImComposition --> ImOrder : section[order].entry[order]
ImComposition --> ConditionEu : section[history].entry
ImComposition --> EuMedicationAdministration : section[history].text
ImComposition --> DeviceEu : section[history].entry
ImComposition --> Observation-pregnancy-status-uv-ips : section[history].entry
ImComposition --> ImGestationalAgeObservation : section[history].entry
ImComposition --> ImPatient : subject
ImComposition --> ImFinding : section[findings].entry[ImFinding]
ImComposition --> ImFinding : section[impression].entry[ImImpression]
ImComposition --> ImImpression : section[impression].entry[ImFinding]
ImComposition --> EuCarePlan : section[recommendation].entry[careplan]
ImComposition --> ImImagingStudy : section[comparison].entry[study]
EHDSImagingReportBody --> ImOrder
ImOrder --> PractitionerRoleEu : requester
ImOrder --> EuCondition : supportingInfo
ImOrder -->  EuObservation : supportingInfo
ImOrder --> EuObservation : supportingInfo
ImOrder --> EuMedicationAdministration : reason
ImOrder --> EuDevice : supportingInfo
EHDSImagingReportBody --> ImGestationalAgeObservation
EHDSImagingReportBody --> ImPatient
EHDSImagingReportBody --> ImImagingStudy
ImImagingStudy --> EuSpecimen : series.specimen
ImImagingStudy --> EuBodyStructure : series.bodySite
EHDSImagingReportBody --> ImRadiationDoseObservation
EHDSImagingReportBody --> EuBodyStructure
EHDSImagingReportBody --> EuMedicationAdministration
EuMedicationAdministration --> ImProcedure : partOf
EHDSImagingReportBody --> ImAdverseEvent
ImAdverseEvent --> ImProcedure : supectEntity[procedure]
ImAdverseEvent --> EuAllergyIntolerance : contributingFactor[allery]
ImAdverseEvent --> ImProcedure : suspectEntity[procedure]
EHDSImagingReportBody --> EuAllergyIntolerance
EHDSImagingReportBody --> ImDiagnosticReport
ImDiagnosticReport --> ImFinding : result
ImDiagnosticReport -->  ImRadiationDoseObservation : result
```

