Profile: ImPatient
Parent: $EuPatient
Id: im-patient
Title: "IM Imaging Patient"
Description: "This profile on Patient represents the Imaging Patient."
* insert SetFmmAndStatusRule( 1, draft )
* insert PartOfImagingManifest
* extension contains $sexParameter-for-clinical-use-url named sexParameterForClinicalUse 0..1
