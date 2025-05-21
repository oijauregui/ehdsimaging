////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Report_EuPatientAnimal
Parent: $EuPatientAnimal
Id: Report-EuPatientAnimal
Title: "Report obligations for EuPatientAnimal"
Description: "Report obligations for EuPatientAnimal"
* extension[http://hl7.org/fhir/StructureDefinition/patient-animal]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSSpecimen.typeOfSpecies"
