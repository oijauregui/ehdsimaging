Profile: ImGestationalAgeObservation
Parent: $EuObservation
Title: "Gestational Age Observation"
Description: "Gestational Age Observation"
* insert SetFmmAndStatusRule( 1, draft )

* code 1..1
* code = $sct#598151000005105 "Gestational age"
* value[x] only QuantityEu
* valueQuantity 1..1 
* valueQuantity from CommonUCUMCodesForAge (extensible)
// TBD: add additional binding to R4
