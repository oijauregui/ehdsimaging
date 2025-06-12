Profile: SpecimenEu
Parent: Specimen
Title: "Specimen: Laboratory"
Description: """This profile defines how to represent Specimens in HL7 FHIR for the purpose of this guide."""

* insert SetFmmAndStatusRule( 1, draft )
* . ^short = "Laboratory Specimen"
* . ^definition = "Laboratory specimen"

* subject only Reference ( $EuPatient or Group  or $EuDevice or Substance or $EuLocation )
* parent only Reference( $EuSpecimen )

// TBD and collection and container to R4
