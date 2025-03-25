Profile: ImAuthoringDeviceProvider
Parent: ImAuthoringDevice
Id: im-authoring-device-provider
Title: "Imaging Authoring Device (ImProvider)"
Description: "Requirements for the provider of the Imaging Authoring Device."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* identifier 0..*
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* name 0..1
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )

Profile: ImAuthoringDevice
Parent: Device
Id: im-authoring-device
Title: "Imaging Authoring Device"
Description: "This profile represents the device used to author the Imaging Diagnostic Report."
* insert SetFmmAndStatusRule( 1, draft )

* identifier 0..*
  * ^definition = """ 
    Authoring device identification number. 
    """
* status 1..1
* name 0..1
  * ^definition = """ 
    Name of the authoring device.
    """
  
Profile: ImImagingDeviceProvider
Parent: ImImagingDevice
Id: im-imaging-device-provider
Title: "Imaging Device (ImProvider)"
Description: "Requirements for the provider of the imaging device."
* insert SetFmmAndStatusRule( 1, draft )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A1.8]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* udiCarrier
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
  * deviceIdentifier
    * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )
* name
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[A.1.8.8]], [[]] )


Profile: ImImagingDevice
Parent: Device
Id: im-imaging-device
Title: "Imaging Device"
Description: "This profile on Device represents the imaging device."
* insert SetFmmAndStatusRule( 1, draft )

* udiCarrier 0..*
  * ^definition = """ 
    Normalized identifier of the acquisition modality equipment instance such as UDI according to REGULATION (EU) 2017/745.
    """
  * deviceIdentifier 1..1
* status 1..1
* name 0..1
  * ^definition = """ 
    Name of the imaging device.
    """
  