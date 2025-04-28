{% include variable-definitions.md %}
The imaging report represent a report made based on an ImagingStudy. In document based deployments. The figure below presents an overview of the data that is part of the imaging-report.

In order to keep the diagram readable, not all references are included 

### Overview

```mermaid
classDiagram
  direction LR
  class ImImagingReport{
    <<Bundle>>
  }
  ImImagingReport *-- "1" ImComposition
  ImImagingReport *-- "1" ImDiagnosticReport
  ImImagingReport *-- "1" ImPatient
  ImImagingReport *-- "0..*" ImOrder
  ImImagingReport *-- "0..*" PractitionerRoleEu
  ImImagingReport *-- "0..*" DeviceEu
  ImImagingReport *-- "0..*" OrganizationEu
  ImImagingReport *-- "0..*" ImImagingStudy
  ImImagingReport *-- "0..*" ImProcedure
  ImImagingReport *-- "0..*" ImImagingSelection
  ImImagingReport *-- "0..*" ImFinding
  ImImagingReport *-- "0..*" ImKeyImageDocumentReference
  ImImagingReport *-- "0..*" ImKeyImageImagingSelection
  ImImagingReport *-- "0..*" ConditionEu: section[impression]
  ImImagingReport *-- "0..*" CarePlanEU

  ImDiagnosticReport --> ImComposition: composition
  

  ImComposition --> ImOrder: extension[basedOn]  
  ImComposition --> PractitionerRoleEu: extension[informationRecipient]
  ImComposition --> ImDiagnosticReport: extension[diagnosticreport-reference]
  ImComposition --> PractitionerRoleEu: author[author]
  ImComposition --> DeviceEu: author[authoring-device]
  ImComposition --> PractitionerRoleEu: attester[legalAuthenticator]
  ImComposition --> PractitionerRoleEu: attester[resultValidator]
  ImComposition --> OrganizationEu: custodian
  ImComposition --> ImPatient: subject
  ImComposition --> ImImagingStudy: event[study].detail
  ImComposition --> ImProcedure: event[procedure].detail
  ImComposition --> ImImagingStudy: section[imagingstudy]
  ImComposition --> ImOrder: section[order]
  ImComposition --> ImProcedure: section[procedure]
  ImComposition --> ImImagingStudy: section[comparison]
  ImComposition --> ImImagingSelection: section[comparison]
  ImComposition --> ImFinding: section[findings]
  ImComposition --> ImKeyImageDocumentReference: section[keyImage]
  ImComposition --> ImKeyImageImagingSelection: section[keyImage]
  ImComposition --> ImFinding: section[impression]
  ImComposition --> ConditionEu: section[impression]
  ImComposition --> ImKeyImageDocumentReference: section[keyImage]
  ImComposition --> ImKeyImageImagingSelection: section[keyImage]
  ImComposition --> CarePlanEU: section[recommendation]

```

The manifest is a FHIR bundle that includes ImComposition and ImDiagnosticReport resources and all resources in tree of resources that referred to (see ($document)[https://www.hl7.org/fhir/composition-operation-document.html]).

### Report Profiles

These define obligations on FHIR resources for systems conforming to this implementation guide.

The imaging specific obligations are specified in:

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'Report_Im%' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}

The common obligations are specified in:

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'Report_Eu%' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}