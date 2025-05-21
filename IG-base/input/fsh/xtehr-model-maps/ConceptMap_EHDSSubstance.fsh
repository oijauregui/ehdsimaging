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
      * display = "C.28.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #code
    * target[+]
      * code = #code
      * display = "C.28.2 - Code"
      * relationship = #equivalent
  * element[+]
    * code = #description
    * target[+]
      * code = #description
      * display = "C.28.3 - Description"
      * relationship = #equivalent
  * element[+]
    * code = #expiry
    * target[+]
      * code = #expiry
      * display = "C.28.4 - Expiry"
      * relationship = #equivalent
  * element[+]
    * code = #quantity
    * target[+]
      * code = #quantity
      * display = "C.28.5 - Quantity"
      * relationship = #equivalent
  * element[+]
    * code = #ingredients
    * target[+]
      * code = #ingredient
      * display = "C.28.6 - Ingredients"
      * relationship = #equivalent
  * element[+]
    * code = #ingredients.quantity
    * target[+]
      * code = #ingredient.quantity
      * display = "C.28.6.1 - Quantity"
      * relationship = #equivalent
  * element[+]
    * code = #ingredients.substance
    * target[+]
      * code = #ingredient.substanceReference
      * display = "C.28.6.2 - Substance"
      * relationship = #equivalent

////////////////////////////////////////////////////
