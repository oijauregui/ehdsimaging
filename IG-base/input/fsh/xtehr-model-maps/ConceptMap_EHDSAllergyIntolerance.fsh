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
      * display = "C.21.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #allergyDescription
    * target[+]
      * code = #text
      * display = "C.21.2 - Allergy description"
      * relationship = #source-is-narrower-than-target
  * element[+]
    * code = #typeOfPropensity
    * target[+]
      * code = #type
      * display = "C.21.3 - Type of propensity"
      * relationship = #equivalent
  * element[+]
    * code = #allergyManifestation
    * target[+]
      * code = #reaction
      * display = "C.21.4 - Allergy manifestation"
      * relationship = #equivalent
  * element[+]
    * code = #allergyManifestation.date
    * target[+]
      * code = #reaction.onset
      * display = "C.21.4.1 - Date"
      * relationship = #equivalent
  * element[+]
    * code = #allergyManifestation.severity
    * target[+]
      * code = #reaction.severity
      * display = "C.21.4.2 - Severity"
      * relationship = #equivalent
  * element[+]
    * code = #allergyManifestation.description
    * target[+]
      * code = #reaction.description
      * display = "C.21.4.3 - Description"
      * relationship = #equivalent
  * element[+]
    * code = #allergyManifestation.manifestation
    * target[+]
      * code = #reaction.manifestation
      * display = "C.21.4.4 - Manifestation"
      * relationship = #equivalent
  * element[+]
    * code = #criticality
    * target[+]
      * code = #criticality
      * display = "C.21.5 - Criticality"
      * relationship = #equivalent
  * element[+]
    * code = #onsetDate
    * target[+]
      * code = #onsetPeriod
      * display = "C.21.6 - Onset date"
      * relationship = #equivalent
    * target[+]
      * code = #onsetDateTime
      * display = "C.21.6 - Onset date"
      * relationship = #equivalent
  * element[+]
    * code = #onsetLifePeriod
    * target[+]
      * code = #onsetString.extension[periodsOfLife]
      * comment = "mapping on onset[x] not possible. Choose string as carrier as specifying a period should be possible. If not possible, add data-absense-extension."
      * display = "C.21.7 - Onset life period"
      * relationship = #equivalent
  * element[+]
    * code = #endDate
    * target[+]
      * code = #extension[abatement].valueDateTime
      * display = "C.21.8 - End date"
      * relationship = #equivalent
  * element[+]
    * code = #endDateLifePeriod
    * noMap = true
  * element[+]
    * code = #status
    * target[+]
      * code = #clinicalStatus
      * display = "C.21.10 - Status"
      * relationship = #equivalent
  * element[+]
    * code = #certainty
    * target[+]
      * code = #verificationStatus
      * display = "C.21.11 - Certainty"
      * relationship = #equivalent
  * element[+]
    * code = #agentOrAllergen
    * target[+]
      * code = #code
      * display = "C.21.12 - Agent or Allergen"
      * relationship = #equivalent
    * target[+]
      * code = #reaction.substance
      * display = "C.21.12 - Agent or Allergen"
      * relationship = #equivalent
  * element[+]
    * code = #patient
    * target[+]
      * code = #patient
      * display = "C.21.13 - Subject"
      * relationship = #equivalent

////////////////////////////////////////////////////
