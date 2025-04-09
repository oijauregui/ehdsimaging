{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
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
link EHDSLocation "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSLocation.html"
class EuLocation{
  <<FHIR>>
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

class organization-eu {
  <<FHIR>>
}
class Location {
  <<FHIR>>
}
EHDSLocation --> EuLocation
EuLocation --> organization-eu : managingOrganization
EuLocation --> Location : partOf
```

