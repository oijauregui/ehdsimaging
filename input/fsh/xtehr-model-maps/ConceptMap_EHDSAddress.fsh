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
      * relationship = #equivalent
  * element[+]
    * code = #type
    * target[+]
      * code = #type
      * relationship = #equivalent
  * element[+]
    * code = #text
    * target[+]
      * code = #text
      * relationship = #equivalent
  * element[+]
    * code = #street
    * target[+]
      * code = #line
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #line.extension[streetName]
      * relationship = #equivalent
  * element[+]
    * code = #houseNumber
    * target[+]
      * code = #line
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #line.extension[houseNumber]
      * relationship = #equivalent
  * element[+]
    * code = #pOBox
    * target[+]
      * code = #line
      * relationship = #source-is-narrower-than-target
    * target[+]
      * code = #line.extension[postBox]
      * relationship = #equivalent
  * element[+]
    * code = #city
    * target[+]
      * code = #city
      * relationship = #equivalent
  * element[+]
    * code = #postalCode
    * target[+]
      * code = #postalCode
      * relationship = #equivalent
  * element[+]
    * code = #country
    * target[+]
      * code = #country
      * relationship = #equivalent
    * target[+]
      * code = #country.extension[countryCode]
      * relationship = #equivalent

////////////////////////////////////////////////////
