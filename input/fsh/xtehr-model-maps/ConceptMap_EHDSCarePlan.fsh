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
      * relationship = #equivalent
  * element[+]
    * code = #status
    * target[+]
      * code = #status
      * comment = "Source binding is preferred, target required."
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #intent
    * target[+]
      * code = #intent
      * comment = "Source binding is preferred, target required."
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #title
    * target[+]
      * code = #title
      * comment = "Source is modelled as Narrative (html), target as string"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #title.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml]
      * relationship = #related-to
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * comment = "Source is modelled as Narrative (html), target as string"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #description.extension[http://hl7.org/fhir/StructureDefinition/rendering-xhtml]
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #period
    * target[+]
      * code = #period
      * relationship = #related-to
  * element[+]
    * code = #custodian
    * target[+]
      * code = #custodian
      * relationship = #related-to
  * element[+]
    * code = #contributor
    * target[+]
      * code = #contributor
      * relationship = #related-to
  * element[+]
    * code = #goal
    * target[+]
      * code = #goal
      * relationship = #related-to
  * element[+]
    * code = #activity
    * target[+]
      * code = #activity
      * relationship = #related-to
  * element[+]
    * code = #note
    * target[+]
      * code = #note
      * relationship = #related-to

////////////////////////////////////////////////////
