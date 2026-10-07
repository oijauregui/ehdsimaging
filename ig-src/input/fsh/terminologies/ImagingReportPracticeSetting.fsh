ValueSet: ImagingReportPracticeSetting
Id: imaging-report-practice-setting
Title: "ValueSet: Practice settings for imaging reports Value Set"
Description: "Dynamically includes all SNOMED CT descendants of Medical specialty (394733009)."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false

// "<" is the SNOMED ECL descendant-of operator: all concepts at every level below the term (term itself not included).
* include codes from system $sct where constraint = "< 394733009"
