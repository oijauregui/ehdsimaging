{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSCoverage {
  <<XtEHR dataset>>
  identifier
  type
  patient
  payor
  payor.payorEntity
  payor.subscriberId
}
link EHDSCoverage "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSCoverage.html"
class EuCoverage{
  <<FHIR>>
  identifier
  type
  beneficiary
  kind
  paymentBy.party
  insurer
  subscriberId
}

class PatientEu {
  <<FHIR>>
}
class PatientEU {
  <<FHIR>>
}
class  RelatedPersion {
  <<FHIR>>
}
class  OrganizationEU {
  <<FHIR>>
}
class OrganizationEu {
  <<FHIR>>
}
EHDSCoverage --> EuCoverage
EuCoverage --> PatientEu : beneficiary
EuCoverage --> PatientEU : paymentBy.party
EuCoverage -->  RelatedPersion : paymentBy.party
EuCoverage -->  OrganizationEU : paymentBy.party
EuCoverage --> OrganizationEu : insurer
```

