Instance: A-1-5-InformationAuthorMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.5 Information Author"
* name = "A.1.5"
* title = "A.1.5 Information Author"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.5 Information Author section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-author"
  
  * element[+]
    * code = #authorIdentifier
    * display = "A.1.5.1 Author identifier"
    * target 
      * code = #practitioner.identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerName
    * display = "A.1.5.2 Author name"
    * target 
      * code = #practitioner.name
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerOrganization
    * display = "A.1.5.3 Author organization"
    * target 
      * code = #organization.name
      * display = ""
      * relationship = #equivalent

  // * element[+]
  //   * code = #providerTelecom
  //   * display = "A.1.5.4 Authoring date and time"
  //   * target 
  //     * code = #practitioner.telecom
  //     * display = ""
  //     * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  
  * element[+]
    * code = #authorIdentifier
    * display = "A.1.5.1 Author identifier"
    * target 
      * code = #identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerName
    * display = "A.1.5.2 Author name"
    * target 
      * code = #name
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  
  * element[+]
    * code = #authorOrganization
    * display = "A.1.5.3 Author organization"
    * target 
      * code = #organization.name
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-author"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  * element[+]
    * code = #authoringDateTime
    * display = "A.1.5 Authoring Datetime"
    * target 
      * code = #issued
      * display = ""
      * relationship = #source-is-narrower-than-target	

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * element[+]
    * code = #author
    * display = "A.1.5 Author"
    * target 
      * code = #author[author]
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #author
    * display = "A.1.5 Authoring Device"
    * target 
      * code = #author[authoring-device]
      * display = ""
      * relationship = #equivalent
      
  * element[+]
    * code = #authoringDateTime
    * display = "A.1.5 Author"
    * target 
      * code = #date
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"

  * element[+]
    * code = #author
    * display = "A.1.5 Author"
    * target 
      * code = #resultsInterpreter[author]
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #author
    * display = "A.1.5 Authoring Device"
    * target 
      * code = #resultsInterpreter
      * display = "Is not mapped"
      * relationship = #not-related-to

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-authoring-device"

  * element[+]
    * code = #authorIdentifier
    * display = "A.1.5 Author"
    * target 
      * code = #identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #authorName
    * display = "A.1.5 Author"
    * target 
      * code = #name
      * display = ""
      * relationship = #equivalent
