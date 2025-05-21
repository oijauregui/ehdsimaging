{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSCondition {
  <<XtEHR dataset>>
  identifier
  description
  code
  onsetDate
  endDate
  category
  clinicalStatus
  resolutionCircumstances
  severity
  anatomicLocation
  stage
  patient
  participant
  participant.function
  participant.actor
  externalResourceRelatedWith
  diagnosisAssertionStatus
}
link EHDSCondition "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSCondition.html"
class EuCondition{
  <<FHIR>>
  identifier
  note
  code
  onset[x]
  abatement[x]
  category
  clinicalStatus
  evidence.concept
  severity
  bodySite
  stage
  stage.summary
  stage.type
  subject
  participant
  participant.function
  participant.actor
  stage.assessment
  extension[relatedArtifact]
  evidence
  verificationStatus
}

class EuPatient {
  <<FHIR>>
}
class EuPracitioner {
  <<FHIR>>
}
class  EuPractitionerRole {
  <<FHIR>>
}
class  EuPatient {
  <<FHIR>>
}
class  EuOrganization {
  <<FHIR>>
}
EHDSCondition --> EuCondition
EuCondition --> EuPatient : subject
EuCondition --> EuPracitioner : participant.actor
EuCondition -->  EuPractitionerRole : participant.actor
EuCondition -->  EuPatient : participant.actor
EuCondition -->  EuOrganization : participant.actor
```

