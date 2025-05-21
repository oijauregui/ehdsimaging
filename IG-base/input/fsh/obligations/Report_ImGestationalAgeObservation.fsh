////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_ImGestationalAgeObservation
Parent: ImGestationalAgeObservation
Id: Report-ImGestationalAgeObservation
Title: "Report obligations for ImGestationalAgeObservation"
Description: "Report obligations for ImGestationalAgeObservation"
* value[x]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReportBody.orderInformation.supportingInformation.gestationalAge"
