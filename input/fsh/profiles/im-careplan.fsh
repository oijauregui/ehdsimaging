Profile: CareplanEu
Parent: CarePlan
Id: eu-careplan
Title: "EU CarePlan"
Description: "Care plan for the patient. 
Contains the narrative containing the plan including proposals, goals, and order requests for monitoring, tracking, or improving the condition of the patient. In the future it is expected that the care plan could be provided in a structured and coded format."
* insert SetFmmAndStatusRule( 1, draft )
* title
  * extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named xthml 0..1
* description
  * extension contains http://hl7.org/fhir/StructureDefinition/rendering-xhtml named xthml 0..1

* subject only Reference(http://hl7.eu/fhir/base/StructureDefinition/patient-eu or Group)

* custodian only Reference(
    http://hl7.eu/fhir/base/StructureDefinition/practitionerRole-eu or 
    http://hl7.eu/fhir/base/StructureDefinition/patient-eu or
    Device or
    RelatedPerson or
    http://hl7.eu/fhir/base/StructureDefinition/organization-eu or
    CareTeam
  )
