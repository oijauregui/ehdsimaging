Profile: ImKeyImageDocumentReference
Parent: $EuDocumentReference
Title: "Imaging Key Image Document Reference"
Description: """A document containing key images for a patient. It can refer to a DICOM or non-DICOM image. When referring to a DICOM image, the DocumentReference.content.attachment.url should be a WADO-URI. When referring to a non-DICOM image, the DocumentReference.content.attachment.url should be a direct URL to the image.\n
When the resource represents a DICOM instance it SHALL contain a the SOP Instance UID in the identifier element. When the resource represents a DICOM series it SHALL contain the Series Instance UID in the identifier element. 
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier 
  * insert SliceElement( #value, $this )
* identifier contains seriesInstanceUid 0..1 and sopClassInstanceUid 0..1
* identifier[seriesInstanceUid] 
  * type 1..1 
  * type = MissingDicomTerminology#00080018
  * system 1..1 
  * system = "urn:ietf:rfc:3986"
  * value 1..1
* identifier[sopClassInstanceUid] 
  * type 1..1
  * type = http://dicom.nema.org/resources/ontology/DCM#112002
  * system 1..1 
  * system = "urn:ietf:rfc:3986"
  * value 1..1
{% if isR5 %}
* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains imorderaccession 0..1
* insert BasedOnImOrderReference( imorderaccession )
{% endif %}

// RuleSet: BasedOnImOrderReference( slicename )
// * basedOn[{slicename}] only Reference( ImOrder )
//   * identifier 1..1
//   * identifier only ImAccessionNumberIdentifier

{% if isR4 %}
* extension contains
  CvDocumentReferenceBasedOn named basedOn 0..1
  and CvDocumentReferenceModality named modality 1..1
* extension
  * ^slicing.discriminator[1].type = #value
  * ^slicing.discriminator[=].path = "value"
* extension[basedOn] contains imorderaccession 0..1
* extension[basedOn][imorderaccession].value[x] only Reference(ImOrder)
  * identifier 1..1
  * identifier only ImAccessionNumberIdentifier
{% endif %}

* category 1..*
  * insert SliceElement( #profile, $this )
* category contains imkeyimages 1..1
* category[imkeyimages]
  * coding
    insert SliceElement( #value, $this )
  * coding contains keyimagecode 1..1
  * coding[keyimagecode] = $loinc#55113-5 "Key images Document Radiology"

{{R5}}* modality 1..1

{{R4}}* extension[modality] 1..1
 
* subject 1..1
* subject only Reference( ImPatient )

* author
  * insert SliceElement( #profile, $this )
* author contains performer 0..*
* author[performer] only Reference( $EuPractitionerRole )
  
* content
  * attachment 1..1
* content 
  * insert SliceElement( #value, [[extension.value]] )
* content contains 
    thumbnail 0..1 and 
    content 1..1
* content[thumbnail] 
  * extension contains $document-reference-thumbnail-url named thumbnail 1..1
  * extension[thumbnail].valueBoolean = true
* content[content] 
  * extension contains $document-reference-thumbnail-url named thumbnail 1..1
  * extension[thumbnail].valueBoolean = false
  * attachment 1..1
    * url 1..1

{% if isR4 %}

Extension: CvDocumentReferenceBasedOn
Id: ext-R5-DocumentReference.basedOn
Title: "Cross-version Extension for R5.DocumentReference.basedOn for use in FHIR R4"
Description: "This cross-version extension represents DocumentReference.basedOn from http://hl7.org/fhir/StructureDefinition/DocumentReference|5.0.0 for use in FHIR R4."
Context: DocumentReference, Media.basedOn
* . 0..*
  * ^short = "Procedure that caused this media to be created"
  * ^definition = "A procedure that is fulfilled in whole or in part by the creation of this media."
  * ^comment = "`Media.basedOn` maps to R4 `Media.basedOn`. So is mapped as Equivalent."
  * ^isModifier = false
* value[x] only Reference(Appointment or AppointmentResponse or CarePlan or Claim or CommunicationRequest or Contract or CoverageEligibilityRequest or DeviceRequest or EnrollmentRequest or ImmunizationRecommendation or MedicationRequest or NutritionOrder or ServiceRequest or SupplyRequest or VisionPrescription)
* url 1..1

{% endif %}
      