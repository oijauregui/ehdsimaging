{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSEncounter {
  <<XtEHR dataset>>
  identifier
  priority
  encounterType
  encounterNote
  patient
  episodeOfCare
  basedOn
  partOf
  serviceProvider
  appointment
  actualPeriod
  plannedStartDate
  plannedEndDate
  admission
  admission.admitter
  admission.admitSource
  admission.referringProfessional
  admission.admissionReason
  admission.admissionReasonComment
  admission.admissionLegalStatus
  discharge
  discharge.destinationType
  discharge.destinationLocation
  location
  location.period
  location.organizationPart
}
link EHDSEncounter "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSEncounter.html"
class EuEncounter{
  <<FHIR>>
  identifier
  priority
  type
  extension[note]
  subject
  episodeOfCare
  basedOn
  partOf
  serviceProvider
  appointment
  actualPeriod
  plannedStartDate
  plannedEndDate
  admission
  participant[admitter].actor
  admission.admitSource
  participant[referrer].actor
  reason.value.reference
  reason.value.concept.text
  extension[legalStatus]
  admission.dischargeDisposition
  admission.destination
  location
  location.period
  location.location
}

class EuPatient {
  <<FHIR>>
}
class EuEpisodeOfCare {
  <<FHIR>>
}
class EuServiceRequest {
  <<FHIR>>
}
class EuEncounter {
  <<FHIR>>
}
class EuOrganization {
  <<FHIR>>
}
class EuAppointment {
  <<FHIR>>
}
class EuLocation {
  <<FHIR>>
}
EHDSEncounter --> EuEncounter
EuEncounter --> EuPatient : subject
EuEncounter --> EuEpisodeOfCare : episodeOfCare
EuEncounter --> EuServiceRequest : basedOn
EuEncounter --> EuEncounter : partOf
EuEncounter --> EuOrganization : serviceProvider
EuEncounter --> EuAppointment : appointment
EuEncounter --> EuLocation : location.location
```

