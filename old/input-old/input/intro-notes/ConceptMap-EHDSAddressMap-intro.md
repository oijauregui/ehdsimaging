{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSAddress {
  <<XtEHR dataset>>
  use
  type
  text
  street
  houseNumber
  pOBox
  city
  postalCode
  country
}
class Address-eu{
  use
  type
  text
  line
  line.extension[streetName]
  line.extension[houseNumber]
  line.extension[postBox]
  city
  postalCode
  country
  country.extension[countryCode]
}

EHDSAddress --> Address-eu
```

