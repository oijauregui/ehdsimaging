////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ProducerObligationPatientAnimalEu
Parent: PatientAnimalEu
Title: "Producer obligation for PatientAnimalEu"
Description: "Producer obligations for PatientAnimalEu"
* extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)

////////////////////////////////////////////////////
