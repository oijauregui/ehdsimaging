Instance: A-1-8-DocumentMetadataMapping
InstanceOf: ConceptMap
Usage: #definition
Title: "Mapping of A.1.8 Document Metadata"

// setting the target to im-diagnostic-report
* name = "A.1.8"
* title = "A.1.8 Document Metadata"
* status = #draft
* experimental = true
* description = "This concept map defines the mapping between the A.1.8 Document Metadata section and the FHIR profiles."

* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-diagnostic-report"
  
  * element[+]
    * code = #documentType
    * display = "A.1.8.1 Document type"
    * target 
      * code = #diagnosticReport.code
      * display = ""
      * relationship = #equivalent
  
  * element[+]
    * code = #accessionNumber
    * display = "A.1.8.11 Accession number"
    * target
      * code = #diagnosticReport.basedOn:imorderaccession
      * display = ""
      * relationship = #equivalent    
  * element[+]
    * code = #documentStatus
    * display = "A.1.8.2 Document status"
    * target
      * code = #diagnosticReport.status
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #reportDateTime
    * display = "A.1.8.3 Report date and time"
    * target
      * code = #diagnosticReport.issued
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #imagingProcedure
    * display = "A.1.8.5 Imaging procedure"
    * target
      * code = #diagnosticReport.supportingInfo:procedure
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #confidentiality
    * display = "A.1.8.7 Confidentiality"
    * target
      * code = #diagnosticReport.meta.security
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #language
    * display = "A.1.8.8 Language"
    * target
      * code = #diagnosticReport.language
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #version
    * display = "A.1.8.9 Version"
    * target
      * code = #diagnosticReport.extension.artifactVersion
      * display = ""
      * relationship = #equivalent


// setting the target to im-composition
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-composition"
  

  * element[+]
    * code = #documentType
    * display = "A.1.8.1 Document type"
    * target 
      * code = #composition.type
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #documentStatus
    * display = "A.1.8.2 Document status"
    * target
      * code = #composition.status
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #reportDateTime
    * display = "A.1.8.3 Report date and time"
    * target
      * code = #composition.date
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #documentTitle
    * display = "A.1.8.4 Document title"
    * target
      * code = #composition.title
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #reportCustodian
    * display = "A.1.8.4 Document Custodian"
    * target
      * code = #composition.custodian
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #confidentiality
    * display = "A.1.8.7 Confidentiality"
    * target
      * code = #composition.meta.security
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #language
    * display = "A.1.8.7 Language"
    * target
      * code = #composition.language
      * display = ""
      * relationship = #equivalent
  * element[+]
    * code = #version
    * display = "A.1.8.9 Version"
    * target
      * code = #composition.extension.artifactVersion
      * display = ""
      * relationship = #equivalent

// setting the target to im-imaging-study
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-imagingstudy"
  
  * element[+]
    * code = #studyInstanceUID
    * display = "A.1.8.10 Legal Study Instance UID"
    * target
      * code = #imagingstudy.identifier:studyUID
      * display = ""
      * relationship = #equivalent

// setting the target to im-order
* group[+]
  * source = "http://hl7.eu/fhir/imaging/StructureDefinition/ehn-medical-imaging-report-header-document-metadata"
  * target = "http://hl7.eu/fhir/imaging/StructureDefinition/im-order"
  
  * element[+]
    * code = #accessionNumber
    * display = "A.1.8.11 Accession number"
    * target
      * code = #order.identifier:accessionNumber
      * display = ""
      * relationship = #equivalent