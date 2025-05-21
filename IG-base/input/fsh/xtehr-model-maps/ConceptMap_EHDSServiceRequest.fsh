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
      * relationship = #equivalent
  * element[+]
    * code = #reasonCode
    * target[+]
      * code = #reason.concept
      * display = "C.8.3 - Reason code"
      * relationship = #equivalent
  * element[+]
    * code = #quantity
    * target[+]
      * code = #quantityQuantity
      * display = "C.8.4 - Quantity"
      * relationship = #equivalent
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * display = "C.8.5 - Anatomic location"
      * relationship = #equivalent
  * element[+]
    * code = #reasonReference
    * target[+]
      * code = #reason.reference
      * display = "C.8.6 - Reason reference"
      * relationship = #equivalent
  * element[+]
    * code = #priority
    * target[+]
      * code = #priority
      * display = "C.8.7 - Priority"
      * relationship = #equivalent
  * element[+]
    * code = #supportingInformation
    * target[+]
      * code = #supportingInfo
      * comment = "Point to observations and conditions"
      * display = "C.8.8 - Supporting information"
      * relationship = #equivalent
  * element[+]
    * code = #specimen
    * target[+]
      * code = #specimen
      * display = "C.8.9 - Specimen"
      * relationship = #equivalent
  * element[+]
    * code = #subject
    * target[+]
      * code = #subject
      * display = "C.8.10 - Subject"
      * relationship = #equivalent
  * element[+]
    * code = #encounter
    * target[+]
      * code = #encounter
      * display = "C.8.11 - Encounter"
      * relationship = #equivalent
  * element[+]
    * code = #occurance[x]
    * target[+]
      * code = #occurrenceDateTime
      * display = "C.8.12 - Occurance"
      * relationship = #equivalent
    * target[+]
      * code = #occurrencePeriod
      * display = "C.8.12 - Occurance"
      * relationship = #equivalent
  * element[+]
    * code = #patientInstructions
    * target[+]
      * code = #patientInstruction.instructionMarkdown
      * display = "C.8.13 - Patient instructions"
      * relationship = #equivalent
  * element[+]
    * code = #coverage
    * target[+]
      * code = #insurance
      * display = "C.8.14 - Coverage"
      * relationship = #equivalent

////////////////////////////////////////////////////
