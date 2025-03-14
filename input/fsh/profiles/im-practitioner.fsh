Profile: ImPractitionerProvider
Parent: ImPractitioner
Id: im-practitioner-provider
Title: "Practitioner (ImProvider)"
Description: "Requirements for the provider of the practitioner."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* identifier
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* active
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* name
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* telecom
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* address
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )

Profile: ImPractitioner
Parent: http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu
Id: im-practitioner
Title: "Practitioner"
Description: """
    Practitioner profile for healthcare professionals, this resource contains all demographic information
    releted to healthcare professionals.
"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier 0..*
* active 0..1
* name 0..*
* telecom 0..*
* address 0..*
