{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSOrganization {
  <<XtEHR dataset>>
  identifier
  type
  name
  address
  telecom
  partOf
}
link EHDSOrganization "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSOrganization.html"
class OrganizationEU{
  <<FHIR>>
  identifier
  type
  name
  contact.address
  contact.telecom
  partOf
}

class organization-eu {
  <<FHIR>>
}
EHDSOrganization --> OrganizationEU
OrganizationEU --> organization-eu : partOf
```

