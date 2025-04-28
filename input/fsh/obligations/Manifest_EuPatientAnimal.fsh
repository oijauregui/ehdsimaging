////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Manifest_EuPatientAnimal
Parent: $EuPatientAnimal
Id: Manifest-EuPatientAnimal
Title: "Manifest obligations for EuPatientAnimal"
Description: "Manifest obligations for EuPatientAnimal"
* extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImManifestProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSSpecimen.typeOfSpecies"
