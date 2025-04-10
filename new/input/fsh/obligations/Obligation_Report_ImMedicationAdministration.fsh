////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ReportProducerObligationImMedicationAdministration
Parent: ImMedicationAdministration
Title: "ReportProducer obligation for ImMedicationAdministration"
Description: "ReportProducer obligations for ImMedicationAdministration"
* partOf
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
