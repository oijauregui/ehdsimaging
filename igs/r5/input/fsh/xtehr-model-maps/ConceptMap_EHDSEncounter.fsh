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
      * relationship = #equivalent
  * element[+]
    * code = #priority
    * target[+]
      * code = #priority
      * display = "C.30.3 - Priority"
      * relationship = #equivalent
  * element[+]
    * code = #encounterType
    * target[+]
      * code = #type
      * display = "C.30.2 - Encounter type"
      * relationship = #equivalent
  * element[+]
    * code = #encounterNote
    * target[+]
      * code = #extension[note]
      * display = "C.30.4 - Encounter note"
      * relationship = #equivalent
  * element[+]
    * code = #patient
    * target[+]
      * code = #subject
      * display = "C.30.5 - Patient"
      * relationship = #equivalent
  * element[+]
    * code = #episodeOfCare
    * target[+]
      * code = #episodeOfCare
      * display = "C.30.6 - Episode of care"
      * relationship = #equivalent
  * element[+]
    * code = #basedOn
    * target[+]
      * code = #basedOn
      * display = "C.30.7 - Based on"
      * relationship = #equivalent
  * element[+]
    * code = #partOf
    * target[+]
      * code = #partOf
      * display = "C.30.8 - Part of"
      * relationship = #equivalent
  * element[+]
    * code = #serviceProvider
    * target[+]
      * code = #serviceProvider
      * display = "C.30.9 - Service provider"
      * relationship = #equivalent
  * element[+]
    * code = #appointment
    * target[+]
      * code = #appointment
      * display = "C.30.10 - Appointment"
      * relationship = #equivalent
  * element[+]
    * code = #actualPeriod
    * target[+]
      * code = #actualPeriod
      * display = "C.30.11 - Actual period"
      * relationship = #equivalent
  * element[+]
    * code = #plannedStartDate
    * target[+]
      * code = #plannedStartDate
      * display = "C.30.12 - Planned start date"
      * relationship = #equivalent
  * element[+]
    * code = #plannedEndDate
    * target[+]
      * code = #plannedEndDate
      * display = "C.30.13 - Planned end date"
      * relationship = #equivalent
  * element[+]
    * code = #admission
    * target[+]
      * code = #admission
      * display = "C.30.14 - Admission"
      * relationship = #equivalent
  * element[+]
    * code = #admission.admitter
    * target[+]
      * code = #participant[admitter].actor
      * display = "C.30.14.1 - Admitter"
      * relationship = #equivalent
  * element[+]
    * code = #admission.admitSource
    * target[+]
      * code = #admission.admitSource
      * display = "C.30.14.2 - Admit Source"
      * relationship = #equivalent
  * element[+]
    * code = #admission.referringProfessional
    * target[+]
      * code = #participant[referrer].actor
      * display = "C.30.14.3 - Referring professional"
      * relationship = #equivalent
  * element[+]
    * code = #admission.admissionReason
    * target[+]
      * code = #reason.value.reference
      * display = "C.30.14.4 - Admission reason"
      * relationship = #equivalent
  * element[+]
    * code = #admission.admissionReasonComment
    * target[+]
      * code = #reason.value.concept.text
      * display = "C.30.14.5 - Admission reason comment"
      * relationship = #equivalent
  * element[+]
    * code = #admission.admissionLegalStatus
    * target[+]
      * code = #extension[legalStatus]
      * display = "C.30.14.6 - Admission legal status"
      * relationship = #equivalent
  * element[+]
    * code = #discharge
    * target[+]
      * code = #admission.dischargeDisposition
      * display = "C.30.15 - Discharge"
      * relationship = #equivalent
  * element[+]
    * code = #discharge.destinationType
    * target[+]
      * code = #admission.dischargeDisposition
      * display = "C.30.15.1 - Destination type"
      * relationship = #equivalent
  * element[+]
    * code = #discharge.destinationLocation
    * target[+]
      * code = #admission.destination
      * display = "C.30.15.2 - Destination location"
      * relationship = #equivalent
  * element[+]
    * code = #location
    * target[+]
      * code = #location
      * display = "C.30.16 - Location"
      * relationship = #equivalent
  * element[+]
    * code = #location.period
    * target[+]
      * code = #location.period
      * display = "C.30.16.1 - Period"
      * relationship = #equivalent
  * element[+]
    * code = #location.organizationPart
    * target[+]
      * code = #location.location
      * display = "C.30.16.2 - Organization part"
      * relationship = #equivalent

////////////////////////////////////////////////////
