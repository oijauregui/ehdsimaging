{% include variable-definitions.md %}

The figure below presents the {{XtEhrImaging}} DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
direction LR
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
link EHDSImagingStudy "https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/StructureDefinition-EHDSImagingStudy.html"
class ImImagingStudy{
  <<FHIR>>
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

class ImWadoEndpoint
class ImImageIidViewerEndpoint
class ImRadiationDoseObservation{
  <<FHIR>>
  component.value[x]
}

class EuPatient {
  <<FHIR>>
}
class EuEncounter {
  <<FHIR>>
}
class EuServiceRequest {
  <<FHIR>>
}
class EuOrganization {
  <<FHIR>>
}
class EuEndpoint {
  <<FHIR>>
}
class  ImWadoEndpoint {
  <<FHIR>>
}
class  ImImageIidViewerEndpoint {
  <<FHIR>>
}
class EuBodyStructure {
  <<FHIR>>
}
class EuSpecimen {
  <<FHIR>>
}
EHDSImagingStudy --> ImImagingStudy
ImImagingStudy --> EuPatient : subject
ImImagingStudy --> EuEncounter : encounter
ImImagingStudy --> EuServiceRequest : basedOn
ImImagingStudy --> EuOrganization : series.performer[custodian]
ImImagingStudy --> EuEndpoint : endpoint
ImImagingStudy -->  ImWadoEndpoint : endpoint
ImImagingStudy -->  ImImageIidViewerEndpoint : endpoint
ImImagingStudy --> EuEndpoint : series.endpoint
ImImagingStudy -->  ImWadoEndpoint : series.endpoint
ImImagingStudy -->  ImImageIidViewerEndpoint : series.endpoint
ImImagingStudy --> EuBodyStructure : series.bodySite
ImImagingStudy --> EuSpecimen : series.specimen
EHDSImagingStudy --> ImWadoEndpoint
EHDSImagingStudy --> ImImageIidViewerEndpoint
EHDSImagingStudy --> ImRadiationDoseObservation
```

