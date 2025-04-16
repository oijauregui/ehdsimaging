////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: Manifest_ImProcedure
Parent: ImProcedure
Id: Manifest-ImProcedure
Title: "Manifest obligations for ImProcedure"
Description: "Manifest obligations for ImProcedure"
* location
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
