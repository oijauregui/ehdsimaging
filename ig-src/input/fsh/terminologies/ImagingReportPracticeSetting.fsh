ValueSet: ImagingReportPracticeSetting
Id: imaging-report-practice-setting
Title: "Practice settings for imaging reports"
Description: "Dynamically includes the immediate SNOMED CT descendants of Medical specialty (394733009) and Clinical specialty (394658006), excluding Clinical oncology and Gynaecological oncology."
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false

// "<!" is the SNOMED ECL child-of operator: immediate children only, no deeper levels.
* include codes from system $sct where constraint = "<! 394733009"
* include codes from system $sct where constraint = "<! 394658006"
* exclude $sct#394592004 "Clinical oncology"
* exclude $sct#408446006 "Gynaecological oncology"
