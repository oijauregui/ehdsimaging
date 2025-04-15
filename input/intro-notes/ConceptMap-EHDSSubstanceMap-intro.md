{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSSubstance {
  <<XtEHR dataset>>
  identifier
  code
  description
  expiry
  quantity
  ingredients
  ingredients.quantity
  ingredients.substance
}
link EHDSSubstance "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSSubstance.html"
class EuSubstance{
  <<FHIR>>
  identifier
  code
  description
  expiry
  quantity
  ingredient
  ingredient.quantity
  ingredient.substanceReference
}

class EuSubstance {
  <<FHIR>>
}
EHDSSubstance --> EuSubstance
EuSubstance --> EuSubstance : ingredient.substanceReference
```

