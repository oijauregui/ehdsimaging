////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSCarePlanMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSCarePlan"
Description: "Map for EHDSCarePlan"
* status = #draft
* experimental = true
* title = "EHDSCarePlan Mapping"
* name = "EHDSCarePlanMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCarePlan"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCarePlan"
  * target = $EuCarePlanUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.19.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #status
    * target[+]
      * code = #status
      * comment = "Source binding is preferred, target required."
      * display = "C.19.2 - Status"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #intent
    * target[+]
      * code = #intent
      * comment = "Source binding is preferred, target required."
      * display = "C.19.3 - Intent"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #title
    * target[+]
      * code = #title
      * comment = "Source is modelled as Narrative (html), target as string"
      * display = "C.19.4 - Title"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #title.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml]
      * display = "C.19.4 - Title"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * comment = "Source is modelled as Narrative (html), target as string"
      * display = "C.19.5 - Description"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #description.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml]
      * display = "C.19.5 - Description"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * display = "C.19.6 - Subject"
      * relationship = #equivalent
  * element[+]
    * code = #period
    * target[+]
      * code = #period
      * display = "C.19.7 - Period"
      * relationship = #equivalent
  * element[+]
    * code = #custodian
    * target[+]
      * code = #custodian
      * display = "C.19.8 - Custodian"
      * relationship = #equivalent
  * element[+]
    * code = #contributor
    * target[+]
      * code = #contributor
      * display = "C.19.9 - Contributor"
      * relationship = #equivalent
  * element[+]
    * code = #goal
    * target[+]
      * code = #goal
      * display = "C.19.11 - Goal"
      * relationship = #equivalent
  * element[+]
    * code = #activity
    * target[+]
      * code = #activity
      * display = "C.19.12 - Activity"
      * relationship = #equivalent
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * display = "C.19.13 - Note"
      * relationship = #equivalent
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCarePlan"
  * element[+]
    * code = #addresses
    * noMap = true
    * display = "(C.19.10 - Addresses)"

////////////////////////////////////////////////////
