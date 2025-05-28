Profile: ProcedureEu
Parent: Procedure
Title: "EU Procedure"
Description: "A procedure profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference( $EuPatient )
// TBD add .used to R4
{% if isR5 %}
* used
  * insert SliceElement( #type, concept )
* used contains device 0..1 
* used[device] only CodeableReference( $EuDevice )
{% endif %}
* bodySite 
  * extension contains $body-site-url named bodyStructure 0..1