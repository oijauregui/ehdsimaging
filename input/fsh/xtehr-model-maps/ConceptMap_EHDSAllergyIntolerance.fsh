////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSAllergyIntoleranceMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSAllergyIntolerance"
Description: "Map for EHDSAllergyIntolerance"
* status = #draft
* experimental = true
* title = "EHDSAllergyIntolerance Mapping"
* name = "EHDSAllergyIntoleranceMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAllergyIntolerance"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSAllergyIntolerance"
  * target = $EuAllergyIntoleranceUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * comment = "Not mapped"
      * display = "C.21.1 - Identifier"
      * relationship = #related-to
  * element[+]
    * code = #allergyDescription
    * target[+]
      * code = #text
      * display = "C.21.2 - Allergy description"
      * relationship = #related-to
  * element[+]
    * code = #typeOfPropensity
    * target[+]
      * code = #type
      * display = "C.21.3 - Type of propensity"
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation
    * target[+]
      * code = #reaction
      * display = "C.21.4 - Allergy manifestation"
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.date
    * target[+]
      * code = #reaction.onset
      * display = "C.21.4.1 - Date"
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.severity
    * target[+]
      * code = #reaction.severity
      * display = "C.21.4.2 - Severity"
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.description
    * target[+]
      * code = #reaction.description
      * display = "C.21.4.3 - Description"
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.manifestation
    * target[+]
      * code = #reaction.manifestation
      * display = "C.21.4.4 - Manifestation"
      * relationship = #related-to
  * element[+]
    * code = #criticality
    * target[+]
      * code = #criticality
      * display = "C.21.5 - Criticality"
      * relationship = #related-to
  * element[+]
    * code = #onsetDate
    * target[+]
      * code = #onsetPeriod.start
      * display = "C.21.6 - Onset date"
      * relationship = #related-to
    * target[+]
      * code = #onsetDateTime
      * display = "C.21.6 - Onset date"
      * relationship = #related-to
  * element[+]
    * code = #onsetLifePeriod
    * target[+]
      * code = #onsetPeriod.extension[periodsOfLife]
      * comment = "mapping on onset[x] not possible. Choose Period as carrier as specifying a period should be possible. If not possible, add data-absense-extension."
      * display = "C.21.7 - Onset life period"
      * relationship = #related-to
  * element[+]
    * code = #endDate
    * target[+]
      * code = #extension[abatement].valueDateTime
      * display = "C.21.8 - End date"
      * relationship = #related-to
  * element[+]
    * code = #endDateLifePeriod
    * noMap = true
  * element[+]
    * code = #status
    * target[+]
      * code = #clinicalStatus
      * display = "C.21.10 - Status"
      * relationship = #related-to
  * element[+]
    * code = #certainty
    * target[+]
      * code = #verificationStatus
      * display = "C.21.11 - Certainty"
      * relationship = #related-to
  * element[+]
    * code = #agentOrAllergen
    * target[+]
      * code = #code
      * display = "C.21.12 - Agent or Allergen"
      * relationship = #related-to
    * target[+]
      * code = #reaction.substance
      * display = "C.21.12 - Agent or Allergen"
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #patient
      * display = "C.21.13 - Subject"
      * relationship = #related-to

////////////////////////////////////////////////////
