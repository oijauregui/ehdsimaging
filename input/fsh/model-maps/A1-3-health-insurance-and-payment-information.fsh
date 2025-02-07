Instance: A-1-3-HealthInsurenceAndPaymentInformationMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.3 Health Insurance and Payment Information"
* name = "A.1.3"
* title = "A.1.3 Health Insurance and Payment Information mapping"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.3. Health Insurance and Payment Information section and the FHIR profiles."
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-health-insurance-information"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-coverage"
  
  * insert ElementMapping( #providerCode, "A.1.3.1 Health Insurance Provider Code", #insurer, "", #equivalent )
  // * element[+]
  //   * code = #providerCode
  //   * display = "A.1.3.1 Health Insurance Provider Code"
  //   * target 
  //     * code = #insurer
  //     * display = ""
  //     * relationship = #equivalent

  * element[+]
    * code = #providerName
    * display = "A.1.3.2 Health insurance provider name"
    * target 
      * code = #insurer
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerNumber
    * display = "A.1.3.3 Health insurance policy number"
    * target 
      * code = #identifier
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-health-insurance-information"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-health-insurance-provider"
  
  * element[+]
    * code = #providerName
    * display = "A.1.3.2 Health insurance provider name"
    * target 
      * code = #name
      * display = ""
      * relationship = #equivalent

  * element[+]
    * code = #providerCode
    * display = "A.1.3.1 Health Insurance Provider Code"
    * target 
      * code = #identifier
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order"
  
  * element[+]
    * code = #insuranceAndPayment
    * display = "A.1.3 Health insurance"
    * target 
      * code = #insurance
      * display = ""
      * relationship = #equivalent

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"

  * element[+]
    * code = #insuranceAndPayment
    * display = "A.1.3 Health insurance"
    * target 
      * code = #section[order].entry[order]
      * display = "Insurance coverage"
      * relationship = #equivalent

  * element[+]
    * code = #insuranceAndPayment
    * display = "A.1.3 Health insurance"
    * target 
      * code = #section[order].entry[insurance]
      * display = "Insurance coverage"
      * relationship = #equivalent

  * element[+]
    * code = #insuranceAndPayment
    * display = "A.1.3 Health insurance"
    * target 
      * code = #section[order].entry[insuranceprovider]
      * display = "Insurance Provider"
      * relationship = #equivalent
