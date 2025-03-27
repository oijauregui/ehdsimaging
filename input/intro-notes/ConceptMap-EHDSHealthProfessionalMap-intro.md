{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSHealthProfessional {
  <<XtEHR dataset>>
  identifier
  name
  address
  telecom
  role
  organization
  specialty
}
class practitionerRole-eu{
  code
  organization
  specialty
}

class practitioner-eu{
  identifier
  name
  address
  telecom
}

EHDSHealthProfessional --> practitionerRole-eu
practitionerRole-eu --> organization-eu : organization
EHDSHealthProfessional --> practitioner-eu
```

