////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ReportProducerObligationimComposition
Parent: imComposition
Title: "ReportProducer obligation for imComposition"
Description: "ReportProducer obligations for imComposition"
* section[comparison].entry[study]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
