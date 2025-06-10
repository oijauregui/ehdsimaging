{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSRelatedPerson {
  <<XtEHR dataset>>
  personalIdentifier
  name
  relationship
  address
  telecom
}
link EHDSRelatedPerson "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSRelatedPerson.html"
class EuRelatedPerson{
  <<FHIR>>
  identifier
  name
  relationship
  address
  telecom
}

EHDSRelatedPerson --> EuRelatedPerson
```

