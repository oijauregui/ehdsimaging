Profile: ConditionEU
Parent: Condition
Id: condition-eu
Title: "EU Condition"
Description: "A condition profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
* bodySite from http://hl7.org/fhir/ValueSet/body-site (preferred)
* subject only Reference( http://hl7.eu/fhir/base/StructureDefinition/patient-eu or Group )
* participant.actor only Reference (
    http://hl7.eu/fhir/base/StructureDefinition/practitioner-eu or 
    http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu or 
    http://hl7.eu/fhir/base/StructureDefinition/patient-eu or
    Device or
    RelatedPerson or
    http://hl7.eu/fhir/base/StructureDefinition/organization-eu or
    CareTeam
  )