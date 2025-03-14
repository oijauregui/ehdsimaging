Profile: ImPractitionerRoleProvider
Parent: ImPractitionerRole
Id: im-practitioner-role-provider
Title: "Practitioner Role (ImProvider)"
Description: "Requirements for the provider of the practitioner role."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImPractitionerRole
Parent: http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu
Id: im-practitioner-role
Title: "Practitioner Role"
Description: """
    Practitioner Role profile for healthcare professionals, all references to healthcare professionals
    will be of this type.
"""
* insert SetFmmAndStatusRule( 1, draft )

* active 0..1
* practitioner 0..1
* practitioner only Reference(ImPractitioner)
* organization 0..1
* organization only Reference(ImOrganization)
