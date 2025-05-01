Profile: Report_ImReportDocumentReference
Id: Report-ImReportDocumentReference
Parent: ImReportIheMhdDocumentReference
Title: "Report Obligations for ImReportIheMhdDocumentReference"
Description: """Report Obligations for ImReportIheMhdDocumentReference"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier[entry-uuid]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* status 1..1 
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* category
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* type
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* subject
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* custodian
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* author
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* relatesTo
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* securityLabel
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* content
  * attachment
    * language
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
    * creation
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical
* modality
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)

Profile: ImReportIheMhdDocumentReference
Parent: ImIheMhdDocumentReference
Title: "Report DocumentReference for MHD deployments"
Description: """
A DocumentReference profile for the Report DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0
* type 1..1 
* type from ImImagingReportTypesEuVS (preferred) 
  * ^short = "Type of Imaging Diagnostic Report"
  * ^definition = "Specifies that it refers to a Imaging Report"
  * ^comment = "Corresponds to the type of the Imaging resource."
* category 1..* 
  * insert SliceElement( #value, $this )
* category contains imaging 1..1 
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* subject 1..1 
* custodian 0..1 
* author 
* relatesTo 0..* 
* securityLabel 0..* 
* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"
* content 1..1
  * attachment 1..1
    * language 
    * creation 
  * profile 1..*
    * insert SliceElement( #value, valueCanonical )
  * profile contains hl7eu-imaging-report 1..1 
  * profile[hl7eu-imaging-report].valueCanonical = Canonical( ImReport )
* bodySite 0..*
* modality 1..* 

Profile: Manifest_ImManifestDocumentReference
Id: Manifest-ImManifestDocumentReference
Parent: ImManifestIheMhdDocumentReference
Title: "Manifest Obligations for ImManifestIheMhdDocumentReference"
Description: """Manifest Obligations for ImManifestIheMhdDocumentReference"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier[entry-uuid]
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* status 1..1 
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* type
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* subject
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* custodian
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* author
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* relatesTo
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* securityLabel
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate-if-known
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* content
  * attachment
    * language
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
    * creation
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
      * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)
* bodySite
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical
* modality
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][+].extension[code].valueCode = #SHALL:populate
  * ^extension[http://hl7.org/fhir/StructureDefinition/obligation][=].extension[actor].valueCanonical = Canonical(ImReportProvider)

Profile: ImManifestIheMhdDocumentReference
Parent: ImIheMhdDocumentReference
Title: "Manifest DocumentReference for MHD deployments"
Description: """
A DocumentReference profile for the Manifest DocumentReference used in MHD deployments. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0
* type 1..1 
* type = $loinc#19005-8
* category 1..* 
  * insert SliceElement( #value, $this )
* category contains imaging 1..1 
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* type from ImImagingManifestTypesEuVS (preferred) 
  * ^short = "Type of Imaging Manifest"
  * ^definition = "Specifies that it refers to a Imaging Manifest"
  * ^comment = "Corresponds to the type of the Imaging Manifest resource."
* subject 1..1 
* custodian 0..1 
* author 
* relatesTo 0..* 
* securityLabel 0..* 
* custodian only Reference(OrganizationEu)
  * ^short = "Organization that manages the Imaging Report"
* content 1..1
  * attachment 1..1
    * language 
    * creation 
  * profile 1..*
    * insert SliceElement( #value, value )
  * profile contains hl7eu-imaging-manifest 1..1 
  * profile[hl7eu-imaging-manifest].valueCanonical = Canonical( ImImagingStudyManifest )
* bodySite 0..*
* modality 1..* 

Profile: ImIheMhdDocumentReference
Parent: DocumentReference
Title: "R5 DocumentReference for MHD deployments"
Description: """A placeholder for a DocumentReference profile for the IHE-MHD in R5. """
* insert SetFmmAndStatusRule( 1, draft )
* modifierExtension 0..0
* identifier
  * insert SliceElement( #value, system )
* identifier contains entry-uuid 1..1
* identifier[entry-uuid] only IheMhdEntryUUIDIdentifier
* status 1..1 
* content 1..1
  * attachment 1..1
    * contentType 1..1



Profile: IheMhdEntryUUIDIdentifier
Parent: Identifier
Title: "Placeholder for IHE MHD Entry UUID Identifier in FHIR R5."
Description: """entryUUID Identifier holding a UUID, based on [IHE-MHD R4](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.EntryUUID.Identifier.html).
"""
* insert SetFmmAndStatusRule( 1, draft )
* use = #official
* type 0..1
* system 1..1
* system = "urn:ietf:rfc:3986"
