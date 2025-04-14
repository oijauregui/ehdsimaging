////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ReportProducerObligationImProcedure
Parent: ImProcedure
Title: "ReportProducer obligation for ImProcedure"
Description: "ReportProducer obligations for ImProcedure"
* location
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
