Profile: LocationImgEu
Parent: LocationEu
Title: "EU Location"
Description: "Details and position information for a place where services are provided and resources and participants may be stored, found, contained, or accommodated."
* insert SetFmmAndStatusRule( 1, draft )
* address only AddressEu
* managingOrganization only Reference( OrganizationEu )
* partOf only Reference( LocationImgEu )
* endpoint only Reference( $EuEndpoint )
