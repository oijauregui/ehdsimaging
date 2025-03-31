Profile: ImRadiationDoseObservation
Parent: Observation
Id: im-radiation-dose-observation
Title: "Radiation Dose Observation"
Description: """
A record for the radiation dose the subject has been exposed to during an imaging procedure.
\n
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html.\n
\n
"""
* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, coding )
* category contains imaging 1..1 and radiation 1..1
* category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* category[radiation] = $loinc#77304-4 
  
* code from ImRadiationDoseDcmCodes
* value[x] only Quantity
* valueQuantity from ImRadiationDoseUnits

ValueSet: ImRadiationDoseDcmCodes
Id: im-radiation-dose-dcm-codes
Title: "Radiation Dose DCM Codes"
Description: "DCM Codes for Radiation Dose."
* http://dicom.nema.org/resources/ontology/DCM#111631 "AverageGlandularDose"
* http://dicom.nema.org/resources/ontology/DCM#111636 "EntranceExposureatRP"
* http://dicom.nema.org/resources/ontology/DCM#111637 "AccumulatedAverageGlandularDose"
* http://dicom.nema.org/resources/ontology/DCM#113518 "OrganDose"
* http://dicom.nema.org/resources/ontology/DCM#113725 "Dose(RP)Total"
* http://dicom.nema.org/resources/ontology/DCM#113728 "FluoroDose(RP)Total"
* http://dicom.nema.org/resources/ontology/DCM#113729 "AcquisitionDose(RP)Total"
* http://dicom.nema.org/resources/ontology/DCM#113738 "Dose(RP)"
* http://dicom.nema.org/resources/ontology/DCM#113830 "Mean CTDI vol"
* http://dicom.nema.org/resources/ontology/DCM#113837 "Mean CTDI free air"
* http://dicom.nema.org/resources/ontology/DCM#113904 "CTDI vol Alert Value"
* http://dicom.nema.org/resources/ontology/DCM#113906 "Accumulated CTDI vol Forward Estimate"
* http://dicom.nema.org/resources/ontology/DCM#113912 "CTDI vol Notification Value"
* http://dicom.nema.org/resources/ontology/DCM#113914 "CTDI vol Forward Estimate"
* http://dicom.nema.org/resources/ontology/DCM#113930 "Size Specific Dose Estimate"
* http://dicom.nema.org/resources/ontology/DCM#130092 "High Dose Fraction Transition Dose"
* http://dicom.nema.org/resources/ontology/DCM#130515 "Air Kerma At Output Measurement Point"

ValueSet: ImRadiationDoseUnits
Id: im-radiation-dose-units
Title: "Radiation Dose Units"
Description: "Units for Radiation Dose."
* $ucum#Gy "Gy"         // Dose
* $ucum#mGy "mGy"       // Dose

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Profile: ImEffectiveDoseObservation
Parent: Observation
Id: im-radiation-dose-information
Title: "Effective Dose Observation"
Description: """
A record for the effective dose the subject has been exposed to during an imaging procedure.
\n
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html.\n
\n
"""
* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, coding )
* category contains imaging 1..1 and radiation 1..1
* category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* category[radiation] = $loinc#77304-4 

* code from ImEffectiveDoseDcmCodes
* value[x] only Quantity
* valueQuantity from ImEffectiveDoseUnits


ValueSet: ImEffectiveDoseDcmCodes
Id: im-effective-dose-dcm-codes
Title: "Effective Dose DCM Codes"
Description: "DCM Codes for Effective Dose."
* http://dicom.nema.org/resources/ontology/DCM#113814 "CTEffectiveDoseTotal"
* http://dicom.nema.org/resources/ontology/DCM#113839 "EffectiveDose"

ValueSet: ImEffectiveDoseUnits
Id: im-effective-dose-units
Title: "Effective Dose Units"
Description: "Units for Effective Dose."
* $ucum#Sv "Sv"        // Effective Dose
* $ucum#mSv "mSv"       // Effective Dose

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Profile: ImDoseLengthProductObservation
Parent: Observation
Id: im-dose-length-product-observation
Title: "Dose Length Product Observation"
Description: """
A record for the dose length product the subject has been exposed to during an imaging procedure.
\n
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html.\n
\n
"""
* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, coding )
* category contains imaging 1..1 and radiation 1..1
* category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* category[radiation] = $loinc#77304-4 

* code from ImDoseLengthProductDcmCodes
* value[x] only Quantity
* valueQuantity from ImDoseLengthUnits

ValueSet: ImDoseLengthProductDcmCodes
Id: im-dose-length-product-dcm-codes
Title: "Dose Length Product DCM Codes"
Description: "DCM Codes for Dose Length Product."
* http://dicom.nema.org/resources/ontology/DCM#113813 "CTDoseLengthProductTotal"
* http://dicom.nema.org/resources/ontology/DCM#113838 "DLP"
* http://dicom.nema.org/resources/ontology/DCM#113903 "DLPAlertValue"
* http://dicom.nema.org/resources/ontology/DCM#113905 "AccumulatedDLPForwardEstimate"
* http://dicom.nema.org/resources/ontology/DCM#113911 "DLPNotificationValue"
* http://dicom.nema.org/resources/ontology/DCM#113913 "DLPForwardEstimate"
* http://dicom.nema.org/resources/ontology/DCM#130745 "CTDoseLengthProductSub-Total"

ValueSet: ImDoseLengthUnits
Id: im-dose-length-units
Title: "Dose Length Units"
Description: "Units for Dose Length."
* $ucum#mGy.cm "mGy.cm" // Dose length product

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Profile: ImGraySquareObservation
Parent: Observation
Id: im-gray-square-observation
Title: "Gray Square Observations"
Description: """
A record for the gray square the subject has been exposed to during an imaging procedure.
\n
E.g. based on information from https://dicom.nema.org/medical/dicom/current/output/html/part16.html.\n
\n
"""
* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, coding )
* category contains imaging 1..1 and radiation 1..1
* category[imaging] = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* category[radiation] = $loinc#77304-4 

* code from ImGraySquareDcmCodes
* value[x] only Quantity
* valueQuantity from ImGraySquareUnits

ValueSet: ImGraySquareDcmCodes
Id: im-gray-square-dcm-codes
Title: "Gray Square DCM Codes"
Description: "DCM Codes for Gray Square."
* http://dicom.nema.org/resources/ontology/DCM#113722 "DoseAreaProductTotal"
* http://dicom.nema.org/resources/ontology/DCM#113726 "FluoroDoseAreaProductTotal"
* http://dicom.nema.org/resources/ontology/DCM#122130 "DoseAreaProduct"

ValueSet: ImGraySquareUnits
Id: im-gray-square-units
Title: "Gray Square Units"
Description: "Units for Gray Square."
* $ucum#Gy.m2 "Gy.m2"   // Dose area product
* $ucum#mGy.cm2 "mGy.cm2"   // Dose area product

