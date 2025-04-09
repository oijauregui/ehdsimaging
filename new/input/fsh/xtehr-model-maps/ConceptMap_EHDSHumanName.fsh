////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSHumanNameMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSHumanName"
Description: "Map for EHDSHumanName"
* status = #draft
* experimental = true
* title = "EHDSHumanName Mapping"
* name = "EHDSHumanNameMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHumanName"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSHumanName"
  * target = "$EuHumanNameUrl"
  * element[+]
    * code = #use
    * target[+]
      * code = #use
      * relationship = #related-to
  * element[+]
    * code = #text
    * target[+]
      * code = #text
      * relationship = #related-to
  * element[+]
    * code = #family
    * target[+]
      * code = #family
      * comment = "Concatenation of family names."
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #family.extension[fathersFamily]
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #family.extension[mothersFamily]
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #given
    * target[+]
      * code = #given
      * relationship = #related-to
  * element[+]
    * code = #prefix
    * target[+]
      * code = #prefix
      * relationship = #related-to
  * element[+]
    * code = #suffix
    * target[+]
      * code = #suffix
      * relationship = #related-to

////////////////////////////////////////////////////
