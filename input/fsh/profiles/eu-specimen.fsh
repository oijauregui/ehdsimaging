Profile: SpecimenEu
Parent: Specimen
Id: specimen-eu
Title: "Specimen: Laboratory"
Description: """This profile defines how to represent Specimens in HL7 FHIR for the purpose of this guide."""

* insert SetFmmAndStatusRule( 1, draft )
* . ^short = "Laboratory Specimen"
* . ^definition = "Laboratory specimen"

* subject only Reference ( PatientEuCore or Group  or DeviceEu or Substance or LocationEu )
* parent only Reference(SpecimenEu)

* collection
  * bodySite only CodeableReference(BodyStructureEu)
  * collected[x] 1..1

* container
  * device only Reference(DeviceEu)
  * location only Reference(LocationEu)