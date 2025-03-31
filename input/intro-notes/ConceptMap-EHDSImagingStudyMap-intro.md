{% include variable-definitions.md %}

The figure below presents the {{ehnImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
class EHDSImagingStudy {
  <<XtEHR dataset>>
  identifier
  modality
  subject
  encounter
  started
  basedOn
  numberOfSeries
  numberOfInstances
  description
  studyCustodian
  studyEndpoint
  series
  series.seriesUid
  series.number
  series.acquisitionModality
  series.description
  series.numberOfInstances
  series.seriesEndpoint
  series.bodySite
  series.laterality
  series.specimen
  series.started
  series.instancesInTheSeries
  series.instancesInTheSeries.instanceTitle
  series.instancesInTheSeries.instanceUid
  series.instancesInTheSeries.sopClass
  series.instancesInTheSeries.instanceNumber
  series.instancesInTheSeries.radiationDoseInformation
  series.instancesInTheSeries.radiationDoseInformation.kap
  series.instancesInTheSeries.radiationDoseInformation.totalKerma
  series.instancesInTheSeries.radiationDoseInformation.endTubeKerma
  series.instancesInTheSeries.radiationDoseInformation.breastThickness
  series.instancesInTheSeries.radiationDoseInformation.abd
  phase
  phase.phaseCode
  phase.radiationDose
}
class ImImagingStudy{
  identifier[studyInstanceUid]
  modality
  subject
  encounter
  started
  basedOn
  numberOfSeries
  numberOfInstances
  description
  series.performer[custodian]
  endpoint
  series
  series.uid
  series.number
  series.modality
  series.description
  series.numberOfInstances
  series.endpoint
  series.bodySite
  series.laterality
  series.specimen
  series.started
  series.instance
  series.instance.extension[instance-description]
  series.instance.uid
  series.instance.sopClass
  series.instance.number
}

EHDSImagingStudy --> ImImagingStudy
ImImagingStudy --> patient-eu : subject
ImImagingStudy --> Encounter : encounter
ImImagingStudy --> ServiceRequest : basedOn
ImImagingStudy --> OrganizationEu : series.performer[custodian]
ImImagingStudy --> Endpoint : endpoint
ImImagingStudy --> BodyStructureEu : series.bodySite
ImImagingStudy --> SpecimenEu : series.specimen
```

