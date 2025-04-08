////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSConditionMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSCondition"
Description: "Map for EHDSCondition"
* status = #draft
* experimental = true
* title = "EHDSCondition Mapping"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCondition"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCondition"
  * target = "EuCondition"
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #equivalent
  * element[+]
    * code = #description
    * target[+]
      * code = #note
      * relationship = #equivalent
  * element[+]
    * code = #code
    * target[+]
      * code = #code
      * relationship = #equivalent
  * element[+]
    * code = #onsetDate
    * target[+]
      * code = #onset[x]
      * relationship = #equivalent
  * element[+]
    * code = #endDate
    * target[+]
      * code = #abetement[x]
      * relationship = #equivalent
  * element[+]
    * code = #category
    * target[+]
      * code = #category
      * relationship = #equivalent
  * element[+]
    * code = #clinicalStatus
    * target[+]
      * code = #clinicalStatus
      * comment = "Target binding is required"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #resolutionCircumstances
    * target[+]
      * code = #evidence.concept
      * comment = "When condition is inactive, the evidence for this should be listed here."
      * relationship = #equivalent
  * element[+]
    * code = #severity
    * target[+]
      * code = #severity
      * relationship = #equivalent
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * relationship = #equivalent
  * element[+]
    * code = #stage
    * target[+]
      * code = #stage
      * relationship = #equivalent
    * target[+]
      * code = #stage.summary
      * comment = "stage code"
      * relationship = #equivalent
    * target[+]
      * code = #stage.type
      * comment = "stage type"
      * relationship = #equivalent
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * relationship = #equivalent
  * element[+]
    * code = #participant
    * target[+]
      * code = #participant
      * relationship = #equivalent
  * element[+]
    * code = #participant.function
    * target[+]
      * code = #participant.function
      * relationship = #equivalent
  * element[+]
    * code = #participant.actor
    * target[+]
      * code = #participant.actor
      * relationship = #equivalent
  * element[+]
    * code = #externalResourceRelatedWith
    * target[+]
      * code = #stage.assessment
      * comment = "Evidence for the condition stage"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #extension[artiface-relatedArtifact]
      * comment = "Refer to external sources."
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #evidence
      * comment = "Evidence for the condidation"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #diagnosisAssertionStatus
    * target[+]
      * code = #verificationStatus
      * relationship = #equivalent

////////////////////////////////////////////////////
