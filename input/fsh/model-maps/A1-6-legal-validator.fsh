Instance: A-1-6-LegalAuthenticatorMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.6 Legal Authenticator"
* name = "A.1.6"
* title = "A.1.6 Legal Authenticator"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.6 Legal Authenticator section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-legal-authenticator"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-legal-authenticator"
  
  * element[+]
    * code = #authenticatorIdentifier
    * display = "A.1.6.1 Legal Authenticator identifier"
    * target 
      * code = #practitioner.identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #authenticatorName
    * display = "A.1.6.2 Legal Authenticator name"
    * target 
      * code = #practitioner.name
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #authenticatorOrganization
    * display = "A.1.6.3 Legal Authenticator organization"
    * target 
      * code = #organization.name
      * display = ""
      * relationship = #equivalent

  // * element[+]
  //   * code = #providerTelecom
  //   * display = "A.1.6.4 Authoring date and time"
  //   * target 
  //     * code = #practitioner.telecom
  //     * display = ""
  //     * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  
  * element[+]
    * code = #authenticatorIdentifier
    * display = "A.1.6.1 Legal Authenticator identifier"
    * target 
      * code = #identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #authenticatorName
    * display = "A.1.6.2 Legal Authenticator name"
    * target 
      * code = #name
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  
  * element[+]
    * code = #authenticatorOrganization
    * display = "A.1.6.3 Legal Authenticator organization"
    * target 
      * code = #name
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  * element[+]
    * code = #authenticatingDateTime
    * display = "A.1.6 Authentication date and timeDatetime"
    * target 
      * code = #issued
      * display = ""
      * relationship = #source-is-narrower-than-target	

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * element[+]
    * code = #authenticator
    * display = "A.1.6 Legal Authenticator"
    * target 
      * code = #attester[legal-authenticator]
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #authenticatingDateTime
    * display = "A.1.6 Authentication date and time"
    * target 
      * code = #attester[legal-authenticator].time
      * display = ""
      * relationship = #equivalent
      