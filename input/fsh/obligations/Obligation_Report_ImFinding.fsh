////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ReportProducerObligationImFinding
Parent: ImFinding
Title: "ReportProducer obligation for ImFinding"
Description: "ReportProducer obligations for ImFinding"
* derivedFrom
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
