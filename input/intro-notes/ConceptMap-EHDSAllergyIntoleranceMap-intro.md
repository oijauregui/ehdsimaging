{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSAllergyIntolerance {
  <<XtEHR dataset>>
  identifier
  allergyDescription
  typeOfPropensity
  allergyManifestation
  allergyManifestation.date
  allergyManifestation.severity
  allergyManifestation.description
  allergyManifestation.manifestation
  criticality
  onsetDate
  onsetLifePeriod
  endDate
  endDateLifePeriod
  status
  certainty
  agentOrAllergen
  patient
}
link EHDSAllergyIntolerance "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSAllergyIntolerance.html"
class EuAllergyIntolerance{
  <<FHIR>>
  identifier
  text
  type
  reaction
  reaction.onset
  reaction.severity
  reaction.description
  reaction.manifestation
  criticality
  onsetPeriod
  onsetDateTime
  onsetString.extension[periodsOfLife]
  extension[abatement].valueDateTime
  clinicalStatus
  verificationStatus
  code
  reaction.substance
  patient
}

class EuPatient {
  <<FHIR>>
}
EHDSAllergyIntolerance --> EuAllergyIntolerance
EuAllergyIntolerance --> EuPatient : patient
```

