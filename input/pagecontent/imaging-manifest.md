The imaging manifest represent a summary of the data stored in a DICOM imaging study. In document based deployments, it is the '*document*' that is searched for and provides the URL's that allow download of the imaging content. The figure below presents an overview of the data that is part of the imaging-manifest.

### Overview

```mermaid
classDiagram
  class ImImagingStudyManifest {
  <<Bundle>>
  }
  class ImWadoEndpoint {
  <<Endpoint>>
  }
  class ImImageIidViewerEndpoint {
  <<Endpoint>>
  }
  class ImImagingDevice {
  <<Device>>
  }
  class ImOrder {
  <<ServiceRequest>>
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
  ImImagingStudyManifest *-- "1..*" ImWadoEndpoint
  ImManifestImagingStudy --> ImWadoEndpoint: endpoint / series.endpoint
  ImManifestImagingStudy --> ImImageIidViewerEndpoint: endpoint / series.endpoint

  
```

The manifest is a FHIR bundle that includes the {{ImagingStudy}} resource and at least one {{Endpoint}}. The {{Endpoint}} resources contain the information that allows the client to access the DICOM data. The current model identifies two different {{Endpoint}}s. One that defines an {{DICOMwebWado}} which will allow download of the imaging data as well as extraction of thumbnails and retrieve the image data in other formasts (e.g. jpeg). The other endpoin defines the information to launch an {{iheIid}} based viewer.

Besides the {{ImagingStudy}} and {{Endpoint}} resources, it is also recommended to include additional resources that reflect information present in DICOM such as information on the patient, performer and imaging device.

The mapping from DICOM these resources is defined in the mapping sections of the resources.

### Structural Profiles

These define constraints on FHIR resources for systems conforming to this implementation guide.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name IN ('ImImagingStudyManifest', 'ImImagingStudy', 'ImWadoEndpoint', 'ImImageIidViewerEndpoint', 'ImOrder') ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}

