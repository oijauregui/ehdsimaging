////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSServiceRequestMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSServiceRequest"
Description: "Map for EHDSServiceRequest"
* status = #draft
* experimental = true
* title = "EHDSServiceRequest Mapping"
* name = "EHDSServiceRequestMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSServiceRequest"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSServiceRequest"
  * target = $EuServiceRequestUrl
  * element[+]
    * code = #serviceText
    * target[+]
      * code = #text
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #serviceCode
    * target[+]
      * code = #code.concept
      * relationship = #related-to
  * element[+]
    * code = #reasonCode
    * target[+]
      * code = #reason.concept
      * relationship = #related-to
  * element[+]
    * code = #quantity
    * target[+]
      * code = #quantityQuantity
      * relationship = #related-to
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * relationship = #related-to
  * element[+]
    * code = #reasonReference
    * target[+]
      * code = #reason.reference
      * relationship = #related-to
  * element[+]
    * code = #priority
    * target[+]
      * code = #priority
      * relationship = #related-to
  * element[+]
    * code = #supportingInformation
    * target[+]
      * code = #supportingInfo
      * comment = "Point to observations and conditions"
      * relationship = #related-to
  * element[+]
    * code = #specimen
    * target[+]
      * code = #specimen
      * relationship = #related-to
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #encounter
    * target[+]
      * code = #encounter
      * relationship = #related-to
  * element[+]
    * code = #occurance[x]
    * target[+]
      * code = #occurenceDateTime
      * relationship = #related-to
    * target[+]
      * code = #occurencePeriod
      * relationship = #related-to
  * element[+]
    * code = #patientInstructions
    * target[+]
      * code = #patientInstructionMarkdown
      * relationship = #related-to
  * element[+]
    * code = #coverage
    * target[+]
      * code = #insurance
      * relationship = #related-to

////////////////////////////////////////////////////
