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
* name = "EHDSConditionMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCondition"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSCondition"
  * target = $EuConditionUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * display = "C.15.1 - Identifier"
      * relationship = #equivalent
  * element[+]
    * code = #description
    * target[+]
      * code = #note
      * display = "C.15.2 - Description"
      * relationship = #equivalent
  * element[+]
    * code = #code
    * target[+]
      * code = #code
      * display = "C.15.3 - Code"
      * relationship = #equivalent
  * element[+]
    * code = #onsetDate
    * target[+]
      * code = #onset[x]
      * display = "C.15.4 - Onset date"
      * relationship = #equivalent
  * element[+]
    * code = #endDate
    * target[+]
      * code = #abatement[x]
      * display = "C.15.5 - End date"
      * relationship = #equivalent
  * element[+]
    * code = #category
    * target[+]
      * code = #category
      * display = "C.15.6 - Category"
      * relationship = #equivalent
  * element[+]
    * code = #clinicalStatus
    * target[+]
      * code = #clinicalStatus
      * comment = "Target binding is required"
      * display = "C.15.7 - Clinical status"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #resolutionCircumstances
    * target[+]
      * code = #evidence.concept
      * comment = "When condition is inactive, the evidence for this should be listed here."
      * display = "C.15.8 - Resolution circumstances"
      * relationship = #equivalent
  * element[+]
    * code = #severity
    * target[+]
      * code = #severity
      * display = "C.15.9 - Severity"
      * relationship = #equivalent
  * element[+]
    * code = #anatomicLocation
    * target[+]
      * code = #bodySite
      * display = "C.15.10 - Anatomic location"
      * relationship = #equivalent
  * element[+]
    * code = #stage
    * target[+]
      * code = #stage
      * display = "C.15.11 - Stage"
      * relationship = #equivalent
    * target[+]
      * code = #stage.summary
      * comment = "stage code"
      * display = "C.15.11 - Stage"
      * relationship = #equivalent
    * target[+]
      * code = #stage.type
      * comment = "stage type"
      * display = "C.15.11 - Stage"
      * relationship = #equivalent
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * display = "C.15.12 - Subject"
      * relationship = #equivalent
  * element[+]
    * code = #participant
    * target[+]
      * code = #participant
      * display = "C.15.13 - Participant"
      * relationship = #equivalent
  * element[+]
    * code = #participant.function
    * target[+]
      * code = #participant.function
      * display = "C.15.13.1 - Function"
      * relationship = #equivalent
  * element[+]
    * code = #participant.actor
    * target[+]
      * code = #participant.actor
      * display = "C.15.13.2 - Actor"
      * relationship = #equivalent
  * element[+]
    * code = #externalResourceRelatedWith
    * target[+]
      * code = #stage.assessment
      * comment = "Evidence for the condition stage"
      * display = "C.15.14 - External Resourcerelated with"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #extension[relatedArtifact]
      * comment = "Refer to external sources."
      * display = "C.15.14 - External Resourcerelated with"
      * relationship = #source-is-broader-than-target
    * target[+]
      * code = #evidence
      * comment = "Evidence for the condidation"
      * display = "C.15.14 - External Resourcerelated with"
      * relationship = #source-is-broader-than-target
  * element[+]
    * code = #diagnosisAssertionStatus
    * target[+]
      * code = #verificationStatus
      * display = "C.15.15 - Diagnosis assertion status"
      * relationship = #equivalent

////////////////////////////////////////////////////
