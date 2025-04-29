{% include variable-definitions.md %}

### Logical model mapping onto HL7 FHIR

The following FHIR {{ConceptMaps}} describe the way the logical model has been mapped onto the FHIR profiles defined in this specification.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='ConceptMap' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}
