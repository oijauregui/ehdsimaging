Profile: ImCoverageProvider
Parent: ImCoverage
Id: im-coverage-provider
Title: "Coverage (ImProvider)"
Description: "Requirements for the provider of the coverage."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* identifier
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* insurer
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )

Profile: ImCoverage
Parent: Coverage
Id: im-coverage
Title: "Coverage information"
Description: "Health Insurance and Payment Information. This resource represents the insurance coverage for a patient."
* insert SetFmmAndStatusRule( 1, draft )

* identifier 0..*
  * ^definition = """ 
    Insurance policy number registered at the provider. Note in some area's this may serve as Patient ID. 
    """
  // TODO -> do we need to specify the identifier type?
* status 1..1

* kind 1..1
* kind = #insurance

* beneficiary 1..1
* beneficiary only Reference(ImPatient)

* period 0..1

* insurer 0..1
* insurer only Reference(ImHealthInsuranceProvider)



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Profile: ImHealthInsuranceProviderProvider
Parent: ImHealthInsuranceProvider
Id: im-health-insurance-provider-provider
Title: "Health Insurance Provider (ImProvider)"
Description: "Requirements for the provider of the health insurance provider."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* identifier
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* name 0..1
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )


Profile: ImHealthInsuranceProvider
Parent: http://hl7.eu/fhir/base/StructureDefinition/organization-eu
Id: im-health-insurance-provider
Title: "Health Insurance Provider"
Description: """
    Health Insurance Provider profile for healthcare organizations, this resource contains all information
    related to a health insurance provider.
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier 0..*
  * ^definition = """ 
    Unique code for the health insurance company.
    """
  // TODO -> do we need to specify the identifier type?
* active 1..1
* name 0..1
  * ^definition = """ 
    Official name of the health insurance provider.
    """
  
