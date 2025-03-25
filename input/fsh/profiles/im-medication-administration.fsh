Profile: ImMedicationAdministrationProvider
Parent: ImMedicationAdministration
Id: im-medication-administration-provider
Title: "Medication Administration (ImProvider)"
Description: "Requirements for the provider of the medication administration."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* partOf
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* medication
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* occurence[x]
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* dosage
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
  * route
    * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )

  
Profile: ImMedicationAdministration
Parent: MedicationAdministration
Id: im-medication-administration
Title: "Medication Administration"
Description: "Record of medication administration during imaging procedure."
* insert SetFmmAndStatusRule( 1, draft )

* partOf only Reference( ImProcedure )
* medication only CodeableReference( ImMedication )
* subject only Reference( ImPatient ) 
* dosage
  * route
  // TODO define valueset with route of administration codes from EQDM

  