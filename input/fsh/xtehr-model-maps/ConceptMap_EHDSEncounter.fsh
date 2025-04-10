////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////

Instance: EHDSEncounterMap
InstanceOf: ConceptMap
Usage: #definition
Title: "Map for EHDSEncounter"
Description: "Map for EHDSEncounter"
* status = #draft
* experimental = true
* title = "EHDSEncounter Mapping"
* name = "EHDSEncounterMap"
* sourceScopeUri = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEncounter"
* group[+]
  * source = "https://www.xt-ehr.eu/specifications/fhir/StructureDefinition/EHDSEncounter"
  * target = $EuEncounterUrl
  * element[+]
    * code = #identifier
    * target[+]
      * code = #identifier
      * relationship = #related-to
  * element[+]
    * code = #priority
    * target[+]
      * code = #priority
      * relationship = #related-to
  * element[+]
    * code = #encounterType
    * target[+]
      * code = #type
      * relationship = #related-to
  * element[+]
    * code = #encounterNote
    * target[+]
      * code = #extension[note]
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * relationship = #related-to
  * element[+]
    * code = #episodeOfCare
    * target[+]
      * code = #episodeOfCare
      * relationship = #related-to
  * element[+]
    * code = #basedOn
    * target[+]
      * code = #basedOn
      * relationship = #related-to
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * relationship = #related-to
  * element[+]
    * code = #serviceProvider
    * target[+]
      * code = #serviceProvider
      * relationship = #related-to
  * element[+]
    * code = #appointment
    * target[+]
      * code = #appointment
      * relationship = #related-to
  * element[+]
    * code = #actualPeriod
    * target[+]
      * code = #actualPeriod
      * relationship = #related-to
  * element[+]
    * code = #plannedStartDate
    * target[+]
      * code = #plannedStartDate
      * relationship = #related-to
  * element[+]
    * code = #plannedEndDate
    * target[+]
      * code = #plannedEndDate
      * relationship = #related-to
  * element[+]
    * code = #admission
    * target[+]
      * code = #participant[admission].actor
      * relationship = #related-to
  * element[+]
    * code = #admission.admitter
    * target[+]
      * code = #participant[admitter].actor
      * relationship = #related-to
  * element[+]
    * code = #admission.admitSource
    * target[+]
      * code = #admission.admitSource
      * relationship = #related-to
  * element[+]
    * code = #admission.referringProfessional
    * target[+]
      * code = #participant[referrrer].actor
      * relationship = #related-to
  * element[+]
    * code = #admission.admissionReason
    * target[+]
      * code = #reason.value.reference
      * relationship = #related-to
  * element[+]
    * code = #admission.admissionReasonComment
    * target[+]
      * code = #reason.value.concept.text
      * relationship = #related-to
  * element[+]
    * code = #admission.admissionLegalStatus
    * target[+]
      * code = #extension[legalStatus]
      * relationship = #related-to
  * element[+]
    * code = #discharge
    * target[+]
      * code = #admission
      * relationship = #related-to
  * element[+]
    * code = #discharge.destinationType
    * target[+]
      * code = #admission.dischargeDisposition
      * relationship = #related-to
  * element[+]
    * code = #discharge.destinationLocation
    * target[+]
      * code = #admission.destination
      * relationship = #related-to
  * element[+]
    * code = #location
    * target[+]
      * code = #location
      * relationship = #related-to
  * element[+]
    * code = #location.period
    * target[+]
      * code = #location.period
      * relationship = #related-to
  * element[+]
    * code = #location.organizationPart
    * target[+]
      * code = #location.location
      * relationship = #related-to

////////////////////////////////////////////////////
