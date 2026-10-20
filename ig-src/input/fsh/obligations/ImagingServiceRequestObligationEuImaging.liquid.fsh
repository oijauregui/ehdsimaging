{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ImagingServiceRequestObligationEuImaging
Parent: ImagingServiceRequestEuImaging
Id: imaging-service-request-obligation-eu-imaging
Title: "ServiceRequest: Imaging Service Request: Obligations"
Description: "Obligations for ServiceRequest: Imaging Service Request"
* identifier[accessionNumber]
  * ^requirements = "EHDSImagingReport.header.accessionNumber"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.accessionNumber"
{% endif %}

{% if isR4 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ImagingServiceRequestObligationEuImaging
Parent: ImagingServiceRequestEuImaging
Id: imaging-service-request-obligation-eu-imaging
Title: "ServiceRequest: Imaging Service Request: Obligations"
Description: "Obligations for ServiceRequest: Imaging Service Request"
* identifier[accessionNumber]
  * ^requirements = "EHDSImagingReport.header.accessionNumber"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.accessionNumber"
{% endif %}

