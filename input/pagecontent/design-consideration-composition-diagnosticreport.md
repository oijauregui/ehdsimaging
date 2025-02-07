### FHIR representation of the report

This guide is part of the HL7 EU suite of report related implementation guides that also includes [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/branches/master/StructureDefinition-Payer.html), [HL7 Europe Hospital Discharge Report](https://build.fhir.org/ig/hl7-eu/hdr/index.html] and (HL7 Europe Patient Summary)[https://build.fhir.org/ig/hl7-eu/eps/).

This implementation guide follows the approach taken by those specifications in that a Imaging Study Report is:

* represented by one `DiagnosticReport` and and `Composition` resource.
* the `DiagnosticReport` will always point to a  `Composition`.
* the referred Composition:
  * defines the report structure, often just a single section;
  * provides a mean for assembling the report as a document (i.e. as a Bundle of type 'document')
* the document Bundle represents the legally signable report and it includes all the data defining the report.

Related to document bundles, the following guidelines are taken over:
* the document bundle SHALL include any resources that are part of the graph of resources that reference or are referenced from the composition set, either directly or indirectly (e.g. recursively in a chain)

``` mermaid
classDiagram
    class ImDiagnosticReport
    class ImComposition
    ImDiagnosticReport --> ImComposition: composition
    ImComposition --> ImDiagnosticReport: extension[diagnosticReport-reference]
```