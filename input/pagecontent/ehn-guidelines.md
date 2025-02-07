
### Overview

The European eHealth Network "(Guideline on the electronic exchange of health data under Cross-Border Directive 2011/24/EU
Medical imaging studies and reports, release 1.1)[https://health.ec.europa.eu/publications/ehn-guidelines-medical-imaging-studies-and-reports_en]" is addressed to the Member States of the European Union and applies to the implementation of interoperable cross-border exchange of imaging study reports in order to support safe and efficient provisioning of care services in another member state.

It could also serve as a guiding principle for the national development and implementation of imaging study reports.

### eHN Guideline logical model.

The eHN Imaging Guideline in section 4 specifies a DATASET, which is a simplified logical model of a imaging study manifest and report. The data set comprises of several basic parts as visualised in the diagram below.

{% include img.html img="eHN-imaging-study-and-report-dataset.png" caption="Figure: eHN Imaging Study and Report dataset" %}

The following table lists the HL7 FHIR logical models used to represent this dataset. To facilitate the references with the eHN data sets the short description of each element reports the label of the eHN element (e.g., A.1.7.2 Result validator name).

The HL7 FHIR logical model requires that element cardinality is specified, while the eHN data set doesn't define them on purpose. For this reason the elements' cardinality of the following FHIR Logical Model should be interpreted with this in mind, thus they should not be considered as "normative".

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web, Url FROM Resources WHERE Type='StructureDefinition' AND Url LIKE '%ehn-%' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}


### Logical model mapping onto HL7 FHIR

The following FHIR `ConcepMaps` describe the way the logical model has been mapped onto the FHIR profiles defined in this specification.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='ConceptMap' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}

