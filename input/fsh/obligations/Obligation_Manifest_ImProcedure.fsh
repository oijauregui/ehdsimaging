////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ManifestProducerObligationImProcedure
Parent: ImProcedure
Title: "ManifestProducer obligation for ImProcedure"
Description: "ManifestProducer obligations for ImProcedure"
* location
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
