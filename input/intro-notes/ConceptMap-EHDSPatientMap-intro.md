{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSPatient {
  <<XtEHR dataset>>
  personalIdentifier
  name
  dateOfBirth
  administrativeGender
  address
  telecom
  maritalStatus
  citizenship
  communicationLanguage
}
class ImPatient{
  identifier
  name
  birthDate
  gender
  address
  telecom
  maritalStatus
  extension[patient-citizenship]
  extension[patient-nationality]
  communication.language
}

EHDSPatient --> ImPatient
```

