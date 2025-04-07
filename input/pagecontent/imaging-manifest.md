The imaging manifest represent a summary of the data stored in a DICOM imaging study. In document based deployments, it is the '*document*' that is searched for and provides the URL's that allow download of the imaging content. The figure below presents an overview of the data that is part of the imaging-manifest.

```mermaid
classDiagram
  class ImImagingStudyManifest {
  <<Bundle>>
  }
  ImImagingStudyManifest *-- "1" ImManifestImagingStudy
  
  ImImagingStudyManifest *-- PatientEU
  ImManifestImagingStudy --> PatientEU: subject
  ImManifestImagingStudy --> PractitionerRoleEu: referrer

  ImImagingStudyManifest *-- ImImagingDevice
  ImManifestImagingStudy --> ImImagingDevice: series.performer[device]
  ImManifestImagingStudy --> PractitionerRoleEu: series.performer[performer]
  
  ImImagingStudyManifest *-- ImOrder
  ImOrder --> PatientEU: subject
  ImOrder --> PractitionerRoleEu: referrer

  ImImagingStudyManifest *-- ImImageIidViewerEndpoint
  ImImagingStudyManifest *-- ImWadoEndpoint
  ImManifestImagingStudy --> ImWadoEndpoint: endpoint / series.endpoint
  ImManifestImagingStudy --> ImImageIidViewerEndpoint: endpoint / series.endpoint
  
```

The mapping from DICOM these resources is defined in the mapping sections of the resources.

Structural Profiles
These define constraints on FHIR resources for systems conforming to this implementation guide.

{% sql { "query" : "SELECT name AS Name, title AS Title, Type, Description, Web, Url FROM Resources WHERE Type='StructureDefinition' AND Url NOT LIKE '%-provider' AND Url LIKE '%StructureDefinition/imm-%' ORDER BY Name", "class" : "lines", "columns" : [ { "name" : "Title" , "type" : "link" , "source" : "Title", "target" : "Web"}, { "name" : "Description", "type" : "markdown", "source" : "Description"} ] } %}
