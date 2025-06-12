Profile: ProcedureEu
Parent: Procedure
Title: "EU Procedure"
Description: "A procedure profile for the EU."
* insert SetFmmAndStatusRule( 1, draft )

* subject only Reference( $EuPatient )
// TBD add .used to R4

* bodySite 
  * extension contains $body-site-url named bodyStructure 0..1
