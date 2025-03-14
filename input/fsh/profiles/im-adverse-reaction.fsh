Profile: ImAdverseReactionProvider
Parent: ImAdverseReaction
Id: im-adversereaction-provider
Title: "Adverse Event (ImProvider)"
Description: "Requirements for the provider of the adverse event."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImAdverseReaction
Parent: AdverseEvent
Id: im-adversereaction
Title: "Adverse Event"
Description: "Adverse event during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )

* extension contains ImAdverseEventCriticality named criticality 0..1
* seriousness 0..1

* occurrence[x] 0..1
* occurrence[x] only dateTime

* suspectEntity ^slicing.discriminator.type = #type
* suspectEntity ^slicing.discriminator.path = ".instanceReference[x]"
* suspectEntity ^slicing.rules = #open
* suspectEntity ^slicing.description = "Slice references to the Procedure instance in which it the adverse event occurred."
* suspectEntity ^slicing.ordered = false
* suspectEntity contains procedureEvent 1..1 and medicationAdministered 0..1

* suspectEntity[procedureEvent] 
  * instance[x] only Reference(ImProcedure)

* suspectEntity[medicationAdministered]
  * instance[x] only CodeableConcept or Reference(ImMedicationAdministration)

* suspectEntity.causality 0..1
  // * causality
  //   * entityRelatedness 0..1
  // * instance[x] 1..1
  // * instance[x] only CodeableConcept or Reference(ImProcedure or Substance or Medication or MedicationAdministration)

* contributingFactor 0..*
  * item[x] 1..1
  * item[x] only Reference(ImAllergicReaction)


Extension: ImAdverseEventCriticality
Id: im-adverse-event-criticality
Title: "Imaging Adverse Event Criticality"
Description: "Replicates AllergyIntolerance.criticality to introduce functionality in AdverseEvent resource."
* insert SetFmmAndStatusRule(1, draft)
* ^context[+].type = #element
* ^context[=].expression = "AdverseEvent"
* value[x] only code
* value[x] from http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality