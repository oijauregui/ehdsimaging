////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSSubstanceMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSSubstance"
Description: "Map for EHDSSubstance"
* status = #draft
* experimental = true
* title = "EHDSSubstance Mapping"
* name = "EHDSSubstanceMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSubstance"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSSubstance"
  * target = $EuSubstanceUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #code
    * target[+]
      * code = #code
      * relationship = #related-to
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * relationship = #related-to
  * element[+]
    * code = #expiry
    * target[+]
      * code = #expiry
      * relationship = #related-to
  * element[+]
    * code = #quantity
    * target[+]
      * code = #quantity
      * relationship = #related-to
  * element[+]
    * code = #ingredients
    * target[+]
      * code = #ingredient
      * relationship = #related-to
  * element[+]
    * code = #ingredients.quantity
    * target[+]
      * code = #ingredient.quantity
      * relationship = #related-to
  * element[+]
    * code = #ingredients.substance
    * target[+]
      * code = #ingredient.substanceReference
      * relationship = #related-to

////////////////////////////////////////////////////
