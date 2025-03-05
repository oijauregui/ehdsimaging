The composition resource represents the core of the document. 

It is divided into different sections, each sections relates to a specific aspect of an imaging study report. 

#### Imaging Study Section

This section holds information related to the imaging studies covered by this report.

The narrative (`section.text`) SHALL contain the data elements indicated in the table below:

| Field | Description | Source |
| ----- | ----------- | ------ |
| StudyInstanceUID | The study instance UID | `entry[imagingstudy].identifier` |
| Status           | The study status       | `entry[imagingstudy].status` |
| Date             | When the study commenced | `entry[imagingstudy].started` |
| Performer        | The performer of the study | `entry[imagingstudy].performer[performer]` |
| Modality         | The modality | `entry[imagingstudy].modality` |
| Device           | The device on which the study was done | `entry[imagingstudy].performer[device].name` |
| Custodian        | The custodian of the study | `entry[imagingstudy].performer[custodian].name` |

#### Order Section

This section holds information related to the order for the imaging study.

The narrative (`section.text`) SHALL contain the data elements indicated in the table below:

| Field | Description | Source |
| ----- | ----------- | ------ |
| Order identifiers | The identifiers for the order                  | `entry[order].identifier` |
| Order status      | The status of the order                        | `entry[order].status` |
| Orderer           | The healthcare professional ordering the study | `entry[order].requester` |
| Order date        | When the study was ordered                     | `entry[order].authoredOn` |
| Order reason      | Why the order was ordered                      | `entry[order].reason` |
| Insurance         | Insurance information                          | `entry[order].insurance` |

///////////////////////////////// HISTORY SECTION ///////////////////////////////////////
* section[history]
  * ^short = "History"
  * code = $loinc#11329-0 "History"

///////////////////////////////// PROCEDURE SECTION ///////////////////////////////////////
* section[procedure]
  * ^short = "Procedure"
  * code = $loinc#55111-9 "Procedure"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      procedure 0..* MS and
      performer 0..* MS and
      imaging-device 0..* MS and
      imaging-phase 0..* MS and
      medication 0..* MS
  * entry[procedure] only Reference(ImProcedure)
  * entry[performer] only Reference(ImPerformer) 
  * entry[imaging-device] only Reference(ImImagingDevice)
  * entry[imaging-phase] only Reference(ImImagingStudyPhase)
  * entry[medication] only Reference(ImMedicationAdministration)

////////////////// COMPARISON SECTION //////////////////////////
* section[comparison]
  * ^short = "History"
  * code = $loinc#18834-2 "Comparison"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      comparedstudy 0..* MS
  * entry[comparedstudy] only Reference(ImImagingStudy or ImImagingSelection)

/////////////////// FINDINGS SECTION //////////////////////////
* section[findings]
  * ^short = "Findings"
  * code = $loinc#59776-5 "Findings"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* MS and
      keyimage 0..* MS
  * entry[finding] only Reference(ImFinding)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImagesSelection)

/////////////////// IMPRESSION SECTION //////////////////////////
* section[impression]
  * ^short = "Impressions"
  * code = $loinc#19005-8 "Impression"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      finding 0..* MS and
      impression 0..* MS and
      keyimage 0..* MS
  * entry[finding] only Reference(ImFinding)
  * entry[impression] only Reference(ImImpression)
  * entry[keyimage] only Reference(ImKeyImageDocumentReference or ImKeyImagesSelection)

/////////////////// RECOMMENDATION SECTION //////////////////////////
* section[recommendation]
  * ^short = "Recommendations"
  * code = $loinc#18783-1 "Recommendation"
  * entry MS
    * insert SliceElement( #profile, $this )
  * entry contains 
      recommendedCarePlan 0..* MS
  * entry[recommendedCarePlan] only Reference(ImRecommendedCarePlan)


/////////////////// COMMUNICATION SECTION //////////////////////////
* section[communication]
  * ^short = "Communications"
  * code = $loinc#18783-1 "Communication"
