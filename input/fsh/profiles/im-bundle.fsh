Profile: ImBundleProvider
Parent: ImBundle
Id: im-bundle-provider
Title: "Bundle: Imaging Study Report (ImProvider)"
Description: "Requirements for the provider of the Imaging Study Report."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )


Profile: ImBundle
Parent: Bundle
Id: im-bundle
Title: "Bundle: Imaging Study Report"
Description: "Clinical document used to represent a Imaging Study Report for the scope of the HL7 Europe project."
* . ^short = "Imaging Study Bundle"
* . ^definition = """
Imaging Study Report composition.\n
A composition is a set of healthcare-related information that is assembled together into a single logical document that 
provides a single coherent statement of meaning, establishes its own context and that has clinical attestation with regard 
to who is making the statement.\n
While a Composition defines the structure, it does not actually contain the content: rather the full content of a document is contained in a Bundle, 
of which the Composition is the first resource contained.
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier ^short = "Business identifier for this Imaging Study Report"
* identifier 1..
* type = #document