Profile: ImOrderProvider
Parent: ImOrder
Id: im-order-provider
Title: "Imaging Order (ImProvider)"
Description: "Requirements for the provider of the imaging order."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* identifier[accessionNumber]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* insurance
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* requester
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* authoredOn
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* reason
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )

Profile: ImOrder
Parent: ServiceRequest
Id: im-order
Title: "Imaging Order"
Description: "This profile on ServiceRequest represents the order for the Imaging Study and report."
* insert SetFmmAndStatusRule( 1, draft )

* identifier 
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
  * ^slicing.description = "Slice on identifier"
  * ^slicing.ordered = false
* identifier contains accessionNumber 0..1  
* identifier[accessionNumber]
  * type 1..1
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN
  * value 1..1
  * system 1..1

* status 1..1

* subject 1..1
* subject only Reference(ImPatient)

// TODO obligation for client?
* intent 1..1

* insurance 0..1
* insurance only Reference(ImCoverage)

* requester 0..1
* requester only Reference(ImOrderPlacer or ImPatient)

* authoredOn 0..1
  
* reason 0..*
  * ^short = "Clinical question/reason for the order"
  * ^definition = "The reason for the order. Can be coded, textual or a reference to a structured element."


Profile: ImAccessionNumberIdentifier
Parent: Identifier
Id: im-accession-number-identifier
Title: "Imaging Accession Number Identifier"
Description: "This profile on Identifier represents the Accession Number for the Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* system 1..1
* value 1..1
* type 1..1
* type = http://terminology.hl7.org/5.1.0/CodeSystem-v2-0203.html#ACSN

Profile: ImOrderReference
Parent: Reference
Id: im-order-reference
Title: "Imaging Accession Number Reference"
Description: "This profile on Reference represents a reference to an Imaging Order."
* insert SetFmmAndStatusRule( 1, draft )
* reference 1..1
* identifier 0..1
* identifier only ImAccessionNumberIdentifier
  
RuleSet: BasedOnImOrderReference( slicename )
* basedOn[{slicename}] only Reference( ImOrder )
  * identifier 0..1
  * identifier only ImAccessionNumberIdentifier
