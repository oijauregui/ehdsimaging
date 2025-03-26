{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSOrganization {
  <<XtEHR dataset>>
  identifier
  type
  name
  address
  telecom
  partOf
}
class organization-eu{
  identifier
  type
  name
  address
  contact.telecom
  partOf
}

EHDSOrganization --> organization-eu
organization-eu --> organization-eu : partOf
```

