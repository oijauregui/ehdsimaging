////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ReportProducerObligationImGestationalAgeObservation
Parent: ImGestationalAgeObservation
Title: "ReportProducer obligation for ImGestationalAgeObservation"
Description: "ReportProducer obligations for ImGestationalAgeObservation"
* valueQuantity
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
