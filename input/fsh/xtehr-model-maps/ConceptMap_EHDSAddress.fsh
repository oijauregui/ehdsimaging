////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSAddressMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSAddress"
Description: "Map for EHDSAddress"
* status = #draft
* experimental = true
* title = "EHDSAddress Mapping"
* name = "EHDSAddressMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAddress"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAddress"
  * target = $EuAddressUrl
  * element[+]
    * code = #use
    * target[+]
      * code = #use
      * display = "C.5.1 - Use"
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * display = "C.5.2 - Type"
      * relationship = #equivalent
  * element[+]
    * code = #text
    * target[+]
      * code = #text
      * display = "C.5.3 - Text"
      * relationship = #equivalent
  * element[+]
    * code = #street
    * target[+]
      * code = #line
      * display = "C.5.4 - Street"
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #line.extension[streetName]
      * display = "C.5.4 - Street"
      * relationship = #equivalent
  * element[+]
    * code = #houseNumber
    * target[+]
      * code = #line
      * display = "C.5.5 - House number"
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #line.extension[houseNumber]
      * display = "C.5.5 - House number"
      * relationship = #equivalent
  * element[+]
    * code = #pOBox
    * target[+]
      * code = #line
      * display = "C.5.6 - P.O. Box"
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #line.extension[postBox]
      * display = "C.5.6 - P.O. Box"
      * relationship = #equivalent
  * element[+]
    * code = #city
    * target[+]
      * code = #city
      * display = "C.5.7 - City"
      * relationship = #equivalent
  * element[+]
    * code = #postalCode
    * target[+]
      * code = #postalCode
      * display = "C.5.8 - Postal code"
      * relationship = #equivalent
  * element[+]
    * code = #country
    * target[+]
      * code = #country
      * display = "C.5.9 - Country"
      * relationship = #equivalent
    * target[+]
      * code = #country.extension[countryCode]
      * display = "C.5.9 - Country"
      * relationship = #equivalent

////////////////////////////////////////////////////
