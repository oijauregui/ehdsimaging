Profile: ProcedureEu
Parent: Procedure
Id: procedure-eu
Title: "EU Procedure"
Description: "A procedure profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference( PatientEu )
* used
  * insert SliceElement( #type, concept )
* used contains device 0..1 
* used[device] only CodeableReference( $EuDevice )