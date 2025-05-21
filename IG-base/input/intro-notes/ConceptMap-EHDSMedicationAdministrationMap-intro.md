{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
class EHDSMedicationAdministration {
  <<XtEHR dataset>>
  identifier
  status
  statusReason
  medication
  occurance[x]
  reason
  note
  dosage
  dosage.dosageDescription
  dosage.site
  dosage.route
  dosage.method
  dosage.dose
  dosage.rate[x]
  subject
}
link EHDSMedicationAdministration "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSMedicationAdministration.html"
class EuMedicationAdministration{
  <<FHIR>>
  identifier
  status
  statusReason
  medication
  occurenceDateTime
  occurencePeriod
  reason
  note
  dosage
  dosage.text
  dosage.site
  dosage.route
  dosage.method
  dosage.dose
  dosage.rateRatio
  dosage.rateQuantity
  subject
}

class EuMedication {
  <<FHIR>>
}
class EuPatient {
  <<FHIR>>
}
EHDSMedicationAdministration --> EuMedicationAdministration
EuMedicationAdministration --> EuMedication : medication
EuMedicationAdministration --> EuPatient : subject
```

