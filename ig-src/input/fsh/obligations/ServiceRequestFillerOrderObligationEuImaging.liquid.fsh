{% if isR5 %}
////////////////////////////////////////////////////
// Generated file. Do not edit.
////////////////////////////////////////////////////
Profile: ServiceRequestFillerOrderObligationEuImaging
Parent: ServiceRequestFillerOrderEuImaging
Id: service-request-filler-order-obligation-eu-imaging
Title: "ServiceRequest: Imaging Filler Order: Obligations"
Description: "Obligations for ServiceRequest: Imaging Filler Order"
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
Profile: ServiceRequestFillerOrderObligationEuImaging
Parent: ServiceRequestFillerOrderEuImaging
Id: service-request-filler-order-obligation-eu-imaging
Title: "ServiceRequest: Imaging Filler Order: Obligations"
Description: "Obligations for ServiceRequest: Imaging Filler Order"
* identifier[accessionNumber]
  * ^requirements = "EHDSImagingReport.header.accessionNumber"
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:able-to-populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(EuImagingReportProducer)
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[documentation].valueMarkdown = "EHDSImagingReport.header.accessionNumber"
{% endif %}

