////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ReportProducerObligationEuPatientAnimal
Parent: EuPatientAnimal
Title: "ReportProducer obligation for EuPatientAnimal"
Description: "ReportProducer obligations for EuPatientAnimal"
* extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
