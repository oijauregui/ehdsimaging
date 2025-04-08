{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSLocation {
  <<XtEHR dataset>>
  identifier
  name
  description
  type
  address
  position
  position.longitude
  position.latitude
  managingOrganization
  partOf
}
class LocationEu{
  identifier
  name
  description
  type
  address
  position
  position.longitude
  position.latitude
  managingOrganization
  partOf
}

EHDSLocation --> LocationEu
LocationEu --> organization-eu : managingOrganization
LocationEu --> Location : partOf
```

