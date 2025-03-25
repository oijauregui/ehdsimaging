Profile: ImBodyStructureProvider
Parent: ImBodyStructure
Id: im-body-structure-provider
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )


Profile: ImBodyStructure
Parent: http://hl7.eu/fhir/base/StructureDefinition/BodyStructure-eu
Id: im-body-structure
* insert SetFmmAndStatusRule( 1, draft )
* morphology 1..1
* active
* includedStructure
  * structure
  * laterality
* excludedStructure