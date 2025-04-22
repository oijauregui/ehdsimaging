////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSMedicationMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSMedication"
Description: "Map for EHDSMedication"
* status = #draft
* experimental = true
* title = "EHDSMedication Mapping"
* name = "EHDSMedicationMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedication"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedication"
  * target = $EuMedicationUrl
  * element[+]
    * noMap = true
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSMedication"
  * element[+]
    * code = #identifyingCode[x]
    * noMap = true
    * display = "(Identifier or code for the product (virtual product, branded product or package). If several identifiers are specified, they shall not have conflicting meanings or very different granularities.)"
  * element[+]
    * code = #classification
    * noMap = true
    * display = "(CodeableConcept)"
  * element[+]
    * code = #productName
    * noMap = true
    * display = "(Name of the product (full name, invented name, other). When the product has different names, the appropriate one for the context should be used. Translations of names can be provided.)"
  * element[+]
    * code = #marketingAuthorisationHolder
    * noMap = true
  * element[+]
    * code = #marketingAuthorisationHolder.organizationName
    * noMap = true
    * display = "(Name of the organisation holding the authorisation for marketing/mahufacturing)"
  * element[+]
    * code = #marketingAuthorisationHolder.organizationIdentifier
    * noMap = true
    * display = "(Identifier of the organisation and/or its physical location)"
  * element[+]
    * code = #doseForm
    * noMap = true
    * display = "(Dose form(s) on a product level. Dose form for a single package item is defined below.)"
  * element[+]
    * code = #packSize
    * noMap = true
    * display = "(UCUM for units of measure. EDQM Standard Terms for units of presentation. (preferred))"
  * element[+]
    * code = #item
    * noMap = true
    * display = "(A medication item. For combination packs, this can be manufactured items with each item having its own dose form and ingredients+strengths defined)"
  * element[+]
    * code = #item.doseForm
    * noMap = true
    * display = "(Dose form)"
  * element[+]
    * code = #item.ingredient
    * noMap = true
    * display = "(Ingredients)"
  * element[+]
    * code = #item.ingredient.isActive
    * noMap = true
    * display = "(Marks if the ingredient is considered an active ingredient. Typically excipients are not needed, so by default active ingredients are expected.)"
  * element[+]
    * code = #item.ingredient.substance
    * noMap = true
    * display = "(Substance)"
  * element[+]
    * code = #item.ingredient.strengthInfo
    * noMap = true
    * display = "(Strength of the product - amount of substance per unit)"
  * element[+]
    * code = #item.ingredient.strengthInfo.strength
    * noMap = true
    * display = "(Concentration or presentation strength, e.g 100mg/1ml or 500mg per 1 tablet)"
  * element[+]
    * code = #item.ingredient.strengthInfo.basisOfStrengthSubstance
    * noMap = true
    * display = "(Substance that the strength refers to, in case it's different from the main substance)"
  * element[+]
    * code = #item.unitOfPresentation
    * noMap = true
    * display = "(Unit of presentation for the manufactured item (tablet, vial, tube). Typically, the smallest countable object in the package.)"
  * element[+]
    * code = #item.containedQuantity
    * noMap = true
    * display = "(Manufactured item quantity for liquids (3ml / 1 vial))"
  * element[+]
    * code = #item.amount
    * noMap = true
    * display = "(Number of such manufactured items in this product (5 vials))"
  * element[+]
    * code = #item.packageType
    * noMap = true
    * display = "(Type of package of the medication item)"
  * element[+]
    * code = #device
    * noMap = true
    * display = "(Administration device included in the product)"
  * element[+]
    * code = #device.deviceQuantity
    * noMap = true
    * display = "(Number of such devices)"
  * element[+]
    * code = #device.device[x]
    * noMap = true
    * display = "(Device coded)"
  * element[+]
    * code = #characteristic
    * noMap = true
    * display = "(Other features of the product)"
  * element[+]
    * code = #characteristic.type
    * noMap = true
    * display = "(A code expressing the type of characteristic)"
  * element[+]
    * code = #characteristic.value[x]
    * noMap = true
    * display = "(Description of the characteristic)"
  * element[+]
    * code = #batch
    * noMap = true
    * display = "(Batch information of a medicinal product. Typically recorded during dispense or administration, rarely known or relevant for a prescription/request.)"
  * element[+]
    * code = #batch.lotNumber
    * noMap = true
    * display = "(Batch identifier of the medicinal product)"
  * element[+]
    * code = #batch.expirationDate
    * noMap = true
    * display = "(Batch expiration date of the medicinal product.)"

////////////////////////////////////////////////////
