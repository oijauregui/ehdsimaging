Instance: A-1-4-InformationRecipientMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.4 Information Recipient"
* name = "A.1.4"
* title = "A.1.4 Information Recipient"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.4 Information Recipient section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-information-recipient"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-information-recipient"
  
  * element[+]
    * code = #recipientIdentifier
    * display = "A.1.4.1 Recipient identifier"
    * target 
      * code = #practitioner.identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerName
    * display = "A.1.4.2 Recipient name"
    * target 
      * code = #practitioner.name
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerOrganization
    * display = "A.1.4.3 Recipient organization"
    * target 
      * code = #organization.name
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerAddress
    * display = "A.1.4.4 Recipient address"
    * target 
      * code = #practitioner.address
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerCountry
    * display = "A.1.4.5 Recipient Country"
    * target 
      * code = #practitioner.address
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerTelecom
    * display = "A.1.4.6 Recipient Telecom"
    * target 
      * code = #practitioner.telecom
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-information-recipient"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-practitioner"
  
  * element[+]
    * code = #recipientIdentifier
    * display = "A.1.4.1 Recipient identifier"
    * target 
      * code = #identifier
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerName
    * display = "A.1.4.2 Recipient name"
    * target 
      * code = #name
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerAddress
    * display = "A.1.4.4 Recipient address"
    * target 
      * code = #address
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerCountry
    * display = "A.1.4.5 Recipient Country"
    * target 
      * code = #address
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerTelecom
    * display = "A.1.4.6 Recipient Telecom"
    * target 
      * code = #practitioner.telecom
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-information-recipient"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-organization"
  
  * element[+]
    * code = #providerOrganization
    * display = "A.1.4.3 Recipient organization"
    * target 
      * code = #organization.name
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * element[+]
    * code = #informationRecipient
    * display = "A.1.4 Information Recipient"
    * target 
      * code = #extension[informationRecipient]
      * display = "Follow choices in HL7 EU laboratory."
      * relationship = #equivalent
