<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ImImagingSelection
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Basic</sch:title>
    <sch:rule context="f:Basic">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-ImagingSelection']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-ImagingSelection': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-ImagingSelection']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-ImagingSelection': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-description']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-description': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-title']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-title': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension</sch:title>
    <sch:rule context="f:Basic/f:extension">
      <sch:assert test="count(f:extension[@url = 'status']) &gt;= 1">extension with URL = 'status': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'status']) &lt;= 1">extension with URL = 'status': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'issued']) &lt;= 1">extension with URL = 'issued': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'studyUid']) &lt;= 1">extension with URL = 'studyUid': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'seriesUid']) &lt;= 1">extension with URL = 'seriesUid': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'seriesNumber']) &lt;= 1">extension with URL = 'seriesNumber': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'frameOfReferenceUid']) &lt;= 1">extension with URL = 'frameOfReferenceUid': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'bodySite']) &lt;= 1">extension with URL = 'bodySite': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension/f:extension</sch:title>
    <sch:rule context="f:Basic/f:extension/f:extension">
      <sch:assert test="count(f:extension[@url = 'function']) &lt;= 1">extension with URL = 'function': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'actor']) &lt;= 1">extension with URL = 'actor': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/_datatype']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/_datatype': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'concept']) &lt;= 1">extension with URL = 'concept': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'reference']) &lt;= 1">extension with URL = 'reference': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'uid']) &gt;= 1">extension with URL = 'uid': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'uid']) &lt;= 1">extension with URL = 'uid': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'number']) &lt;= 1">extension with URL = 'number': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'sopClass']) &lt;= 1">extension with URL = 'sopClass': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension/f:extension/f:extension</sch:title>
    <sch:rule context="f:Basic/f:extension/f:extension/f:extension">
      <sch:assert test="count(f:value[x]) &gt;= 1">value[x]: minimum cardinality of 'value[x]' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'regionType']) &gt;= 1">extension with URL = 'regionType': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'regionType']) &lt;= 1">extension with URL = 'regionType': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'coordinate']) &gt;= 1">extension with URL = 'coordinate': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'regionType']) &gt;= 1">extension with URL = 'regionType': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'regionType']) &lt;= 1">extension with URL = 'regionType': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'coordinate']) &gt;= 1">extension with URL = 'coordinate': minimum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
