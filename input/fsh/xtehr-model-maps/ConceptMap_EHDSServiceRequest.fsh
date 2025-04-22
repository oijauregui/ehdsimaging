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
      * display = "C.8.1 - Service text"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #serviceCode
    * target[+]
      * code = #code.concept
      * display = "C.8.2 - Service code"
      * relationship = #related-to
  * element[+]
    * code = #reasonCode
    * target[+]
      * code = #reason.concept
      * display = "C.8.3 - Reason code"
      * relationship = #related-to
  * element[+]
    * code = #quantity
    * target[+]
      * code = #quantityQuantity
      * display = "C.8.4 - Quantity"
      * relationship = #related-to
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * display = "C.8.5 - Anatomic location"
      * relationship = #related-to
  * element[+]
    * code = #reasonReference
    * target[+]
      * code = #reason.reference
      * display = "C.8.6 - Reason reference"
      * relationship = #related-to
  * element[+]
    * code = #priority
    * target[+]
      * code = #priority
      * display = "C.8.7 - Priority"
      * relationship = #related-to
  * element[+]
    * code = #supportingInformation
    * target[+]
      * code = #supportingInfo
      * comment = "Point to observations and conditions"
      * display = "C.8.8 - Supporting information"
      * relationship = #related-to
  * element[+]
    * code = #specimen
    * target[+]
      * code = #specimen
      * display = "C.8.9 - Specimen"
      * relationship = #related-to
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "C.8.10 - Subject"
      * relationship = #related-to
  * element[+]
    * code = #encounter
    * target[+]
      * code = #encounter
      * display = "C.8.11 - Encounter"
      * relationship = #related-to
  * element[+]
    * code = #occurance[x]
    * target[+]
      * code = #occurrenceDateTime
      * display = "C.8.12 - Occurance"
      * relationship = #related-to
    * target[+]
      * code = #occurrencePeriod
      * display = "C.8.12 - Occurance"
      * relationship = #related-to
  * element[+]
    * code = #patientInstructions
    * target[+]
      * code = #patientInstruction.instructionMarkdown
      * display = "C.8.13 - Patient instructions"
      * relationship = #related-to
  * element[+]
    * code = #coverage
    * target[+]
      * code = #insurance
      * display = "C.8.14 - Coverage"
      * relationship = #related-to

////////////////////////////////////////////////////
