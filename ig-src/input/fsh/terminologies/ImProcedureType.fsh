ValueSet: ProcedureEuImagingType
Id: im-procedure-type
Title: "ValueSet: Imaging Procedure Type"
Description: """
This value set includes imaging procedure types combining the LOINC/RSNA Radiology Playbook value set (`http://loinc.org/vs/loinc-rsna-radiology-playbook`) for the radiology imaging exams (e.g. "CT Abdomen and Pelvis W contrast IV") and SNOMED CT for image-producing procedures that are not radiology exams, namely endoscopic procedures (e.g. bronchoscopy, colonoscopy) and camera-/photography-based imaging (e.g. ophthalmic fundus and slit-lamp photography). The value set is intended to be used in the context of the EHDS Imaging Report implementation guide.
"""
* insert SetFmmAndStatusRule( 1, draft )
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement. This value set also includes content from LOINC (http://loinc.org), copyright © 1995+ Regenstrief Institute, Inc. and available at no cost under the license at http://loinc.org/license, and the LOINC/RSNA Radiology Playbook, produced in collaboration with the Radiological Society of North America (RSNA). LOINC® is a registered United States trademark of Regenstrief Institute, Inc."
* ^experimental = false
// LOINC/RSNA Radiology Playbook value set — radiology imaging exams (e.g. "CT Abdomen and Pelvis W contrast IV")
* include codes from valueset $loincRsnaPlaybook
// SNOMED CT — endoscopic procedures (e.g. bronchoscopy, colonoscopy) not covered by the Radiology Playbook
* include codes from system $sct where concept is-a #423827005
* exclude $sct#423827005 // "Endoscopy (procedure)" grouping concept
// SNOMED CT — camera-/photography-based imaging, incl. ophthalmic photography (e.g. fundus, slit-lamp)
* include codes from system $sct where concept is-a #169283005
* exclude $sct#169283005 // "Medical photography (procedure)" grouping concept