Profile: DocumentReferenceEu
Parent: DocumentReference
Description: "A DocumentReference profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )
// * extension contains $workflow-reason-url named reason 0..* // does not compile remove for now
* extension contains $note-url named note 0..1 and CrossversionMediaViewExtension named view 0..1

Extension: CrossversionMediaViewExtension
Title: "Media.view extension"
Description: "This cross version extension includes the FHIR R4 version of the Media.view field which has at this point in time (April 18, 2025), not yet been included in the extension pack."
Context: DocumentReference
* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/media-view