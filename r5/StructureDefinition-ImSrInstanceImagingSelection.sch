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
    <sch:title>f:ImagingSelection</sch:title>
    <sch:rule context="f:ImagingSelection">
      <sch:assert test="count(f:studyUid) &gt;= 1">studyUid: minimum cardinality of 'studyUid' is 1</sch:assert>
      <sch:assert test="count(f:seriesUid) &gt;= 1">seriesUid: minimum cardinality of 'seriesUid' is 1</sch:assert>
      <sch:assert test="count(f:instance) &gt;= 1">instance: minimum cardinality of 'instance' is 1</sch:assert>
      <sch:assert test="count(f:instance) &lt;= 1">instance: maximum cardinality of 'instance' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ImagingSelection/f:instance</sch:title>
    <sch:rule context="f:ImagingSelection/f:instance">
      <sch:assert test="count(f:subset) &lt;= 0">subset: maximum cardinality of 'subset' is 0</sch:assert>
      <sch:assert test="count(f:imageRegion2D) &lt;= 0">imageRegion2D: maximum cardinality of 'imageRegion2D' is 0</sch:assert>
      <sch:assert test="count(f:imageRegion3D) &lt;= 0">imageRegion3D: maximum cardinality of 'imageRegion3D' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
