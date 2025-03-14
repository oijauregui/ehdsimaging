
Profile: ImOrganizationProvider
Parent: ImOrganization
Id: im-organization-provider
Title: "Organization (ImProvider)"
Description: "Requirements for the provider of the organization."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* active
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* name
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* contact
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImOrganization
Parent: http://hl7.eu/fhir/base/StructureDefinition/organization-eu
Id: im-organization
Title: "Organization"
Description: """
    Organization profile for healthcare organizations, this resource contains all information
    related to healthcare organizations.
"""
* insert SetFmmAndStatusRule( 1, draft )
