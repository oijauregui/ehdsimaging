////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ManifestProducerObligationImMedicationAdministration
Parent: ImMedicationAdministration
Title: "ManifestProducer obligation for ImMedicationAdministration"
Description: "ManifestProducer obligations for ImMedicationAdministration"
* partOf
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
