Profile: ImRadiationDoseObservationProvider
Parent: ImRadiationDoseObservation
Id: im-radiation-dose-information-provider
Title: "Radiation Dose Observation (ImProvider)"
Description: "REquirements for the provider of radiation dose information."	
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* category
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* valueQuantity 
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )


Profile: ImRadiationDoseObservation
Parent: ImFinding
Id: im-radiation-dose-information
Title: "Radiation Dose Observation"
Description: """
A record for the radiation dose the subject has been exposed to during an imaging procedure.\n
This resource is a placeholder pending further refinement in this topic.\n
\n
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html.
"""	

// Kerma area product (KAP), Total KAP, Kerma at the end of tube (dental X-ray), 
// Thickness of breast for the calculation of Average absorbed breast dose. Further 
// work is needed to refine this definition of dose data in the imaging study 
// manifest. The presence of the dose management reports within the imaging 
// study as standardized by DICOM may be an alternative to consider in later 
// revision of this guideline."


* category 1..1
  // add radiation dose category in line with current vital signs designs.

* code 1..1
  * coding
    * insert SliceElement( #value, $this )
  * coding contains magiccode 1..1
  * coding[magiccode] = $loinc#LP190649-6 "Radiation dose"
  // TODO what code/valueset to use.
  // do we need a magic code for radiation dose?

* value[x] only Quantity 
* valueQuantity 
  * ^binding.valueSet = Canonical( ImRadiationDoseObservationUnitValueSet )
  * ^binding.strength = #extensible
// * value contains dose 0..1 and doselength 0..1
// * value[dose]
//   * unit = "mGy"
//   * system = "http://unitsofmeasure.org"
//   * code = "mGy"
// * valueQuantity[doseLength]
//   * unit = "mGy.cm"
//   * system = "http://unitsofmeasure.org"
//   * code = "mGy.cm"

ValueSet: ImRadiationDoseObservationUnitValueSet
Id: im-radiation-dose-observation-unit-vs
Title: "Radiation Dose Observation Unit ValueSet"
Description: "Units for Radiation Dose Observations."
* $ucum#mGy "mGy"
* $ucum#mGy.cm "mGy.cm"
* $ucum#mSv "mSv"
