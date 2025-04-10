////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ManifestProducerObligationEuPatientAnimal
Parent: EuPatientAnimal
Title: "ManifestProducer obligation for EuPatientAnimal"
Description: "ManifestProducer obligations for EuPatientAnimal"
* extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
