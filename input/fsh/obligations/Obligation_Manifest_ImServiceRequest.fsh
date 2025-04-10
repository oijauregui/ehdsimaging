////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ManifestProducerObligationImServiceRequest
Parent: ImServiceRequest
Title: "ManifestProducer obligation for ImServiceRequest"
Description: "ManifestProducer obligations for ImServiceRequest"
* insurrance
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImProvider)
