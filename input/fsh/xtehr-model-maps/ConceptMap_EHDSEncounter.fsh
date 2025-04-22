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
      * display = "C.30.1 - Identifier"
      * relationship = #related-to
  * element[+]
    * code = #priority
    * target[+]
      * code = #priority
      * display = "C.30.3 - Priority"
      * relationship = #related-to
  * element[+]
    * code = #encounterType
    * target[+]
      * code = #type
      * display = "C.30.2 - Encounter type"
      * relationship = #related-to
  * element[+]
    * code = #encounterNote
    * target[+]
      * code = #extension[note]
      * display = "C.30.4 - Encounter note"
      * relationship = #related-to
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * display = "C.30.5 - Patient"
      * relationship = #related-to
  * element[+]
    * code = #episodeOfCare
    * target[+]
      * code = #episodeOfCare
      * display = "C.30.6 - Episode of care"
      * relationship = #related-to
  * element[+]
    * code = #basedOn
    * target[+]
      * code = #basedOn
      * display = "C.30.7 - Based on"
      * relationship = #related-to
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * display = "C.30.8 - Part of"
      * relationship = #related-to
  * element[+]
    * code = #serviceProvider
    * target[+]
      * code = #serviceProvider
      * display = "C.30.9 - Service provider"
      * relationship = #related-to
  * element[+]
    * code = #appointment
    * target[+]
      * code = #appointment
      * display = "C.30.10 - Appointment"
      * relationship = #related-to
  * element[+]
    * code = #actualPeriod
    * target[+]
      * code = #actualPeriod
      * display = "C.30.11 - Actual period"
      * relationship = #related-to
  * element[+]
    * code = #plannedStartDate
    * target[+]
      * code = #plannedStartDate
      * display = "C.30.12 - Planned start date"
      * relationship = #related-to
  * element[+]
    * code = #plannedEndDate
    * target[+]
      * code = #plannedEndDate
      * display = "C.30.13 - Planned end date"
      * relationship = #related-to
  * element[+]
    * code = #admission
    * target[+]
      * code = #admission
      * display = "C.30.14 - Admission"
      * relationship = #related-to
  * element[+]
    * code = #admission.admitter
    * target[+]
      * code = #participant[admitter].actor
      * display = "C.30.14.1 - Admitter"
      * relationship = #related-to
  * element[+]
    * code = #admission.admitSource
    * target[+]
      * code = #admission.admitSource
      * display = "C.30.14.2 - Admit Source"
      * relationship = #related-to
  * element[+]
    * code = #admission.referringProfessional
    * target[+]
      * code = #participant[referrer].actor
      * display = "C.30.14.3 - Referring professional"
      * relationship = #related-to
  * element[+]
    * code = #admission.admissionReason
    * target[+]
      * code = #reason.value.reference
      * display = "C.30.14.4 - Admission reason"
      * relationship = #related-to
  * element[+]
    * code = #admission.admissionReasonComment
    * target[+]
      * code = #reason.value.concept.text
      * display = "C.30.14.5 - Admission reason comment"
      * relationship = #related-to
  * element[+]
    * code = #admission.admissionLegalStatus
    * target[+]
      * code = #extension[legalStatus]
      * display = "C.30.14.6 - Admission legal status"
      * relationship = #related-to
  * element[+]
    * code = #discharge
    * target[+]
      * code = #admission.dischargeDisposition
      * display = "C.30.15 - Discharge"
      * relationship = #related-to
  * element[+]
    * code = #discharge.destinationType
    * target[+]
      * code = #admission.dischargeDisposition
      * display = "C.30.15.1 - Destination type"
      * relationship = #related-to
  * element[+]
    * code = #discharge.destinationLocation
    * target[+]
      * code = #admission.destination
      * display = "C.30.15.2 - Destination location"
      * relationship = #related-to
  * element[+]
    * code = #location
    * target[+]
      * code = #location
      * display = "C.30.16 - Location"
      * relationship = #related-to
  * element[+]
    * code = #location.period
    * target[+]
      * code = #location.period
      * display = "C.30.16.1 - Period"
      * relationship = #related-to
  * element[+]
    * code = #location.organizationPart
    * target[+]
      * code = #location.location
      * display = "C.30.16.2 - Organization part"
      * relationship = #related-to

////////////////////////////////////////////////////
