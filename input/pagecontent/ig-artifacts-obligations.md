This page shows the actor artifacts and the profiles that define the obligations for each actor.

### Actors

The following artifacts define the types of individuals and/or systems that will interact as part of the use cases covered by this implementation guide.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Description, Web, Url FROM Resources WHERE Type='ActorDefinition' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}

### Provider Profiles

These define obligations on the structural profiles.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Description, Web, Url FROM Resources WHERE Type='StructureDefinition' AND Url LIKE '%-provider' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}

### Consumer Profiles

These define obligations on the structural profiles.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Description, Web, Url FROM Resources WHERE Type='StructureDefinition' AND Url LIKE '%-consumer' ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"    , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown", "source" : "Description"}
  ]
} %}
