
This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structural Profiles

These define constraints on FHIR resources for systems conforming to this implementation guide.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web, Url FROM Resources WHERE Type='StructureDefinition' AND Url NOT LIKE '%-provider' AND Url NOT LIKE '%StructureDefinition/ehn-%' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}



### ValueSets

These define sets of codes used by systems conforming to this implementation guide.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Description, Web, Url FROM Resources WHERE Type='ValueSet' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}

### CodeSystems

These define new code systems used by systems conforming to this implementation guide.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Description, Web, Url FROM Resources WHERE Type='CodeSystem' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}
