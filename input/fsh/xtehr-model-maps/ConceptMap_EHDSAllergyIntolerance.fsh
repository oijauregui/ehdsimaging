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
      * relationship = #related-to
  * element[+]
    * code = #allergyDescription
    * target[+]
      * code = #text
      * relationship = #related-to
  * element[+]
    * code = #typeOfPropensity
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation
    * target[+]
      * code = #reaction
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.date
    * target[+]
      * code = #reaction.onset
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.severity
    * target[+]
      * code = #reaction.severity
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.description
    * target[+]
      * code = #reaction.description
      * relationship = #related-to
  * element[+]
    * code = #allergyManifestation.manifestation
    * target[+]
      * code = #reaction.manifestation
      * relationship = #related-to
  * element[+]
    * code = #criticality
    * target[+]
      * code = #criticality
      * relationship = #related-to
  * element[+]
    * code = #onsetDate
    * target[+]
      * code = #onsetPeriod.start
      * relationship = #related-to
    * target[+]
      * code = #onsetDateTime
      * relationship = #related-to
  * element[+]
    * code = #onsetLifePeriod
    * target[+]
      * code = #onsetPeriod.extension[periodsOfLife]
      * comment = "mapping on onset[x] not possible. Choose Period as carrier as specifying a period should be possible. If not possible, add data-absense-extension."
      * relationship = #related-to
  * element[+]
    * code = #endDate
    * target[+]
      * code = #extension[abatement].valueDateTime
      * relationship = #related-to
  * element[+]
    * code = #endDateLifePeriod
    * noMap = true
  * element[+]
    * code = #status
    * target[+]
      * code = #clinicalStatus
      * relationship = #related-to
  * element[+]
    * code = #certainty
    * target[+]
      * code = #verificationStatus
      * relationship = #related-to
  * element[+]
    * code = #agentOrAllergen
    * target[+]
      * code = #code
      * relationship = #related-to
    * target[+]
      * code = #reaction.substance
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #patient
      * relationship = #related-to

////////////////////////////////////////////////////
