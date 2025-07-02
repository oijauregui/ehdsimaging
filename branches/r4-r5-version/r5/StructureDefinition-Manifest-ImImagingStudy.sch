<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ImImagingStudy
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ImagingStudy/f:series/f:instance</sch:title>
    <sch:rule context="f:ImagingStudy/f:series/f:instance">
      <sch:assert test="count(f:extension[@url = 'http://hl7.eu/fhir/imaging-r5/StructureDefinition/instance-description']) &lt;= 1">extension with URL = 'http://hl7.eu/fhir/imaging-r5/StructureDefinition/instance-description': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
