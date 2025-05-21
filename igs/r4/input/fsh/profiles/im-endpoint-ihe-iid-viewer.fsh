Profile: ImImageIidViewerEndpoint
Parent: EndpointEu
Title: "IM Image Viewer Endpoint"
Description: """
This profile defines a placeholder for an Endpoint for a viewer that can be used to access the study, serie it is present on.
The application is based on [IHE-IID](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf).
"""
* insert SetFmmAndStatusRule( 1, "draft" )




* extension contains
  $cvEndpoint-connectionType named connectionType 1..*
  * extension[connectionType] 
    * insert SliceElement( #value, coding ) 
  * extension[connectionType] contains iid 1..1
  * extension[connectionType][iid] = Hl7EuImagingEndpointTerminologyCodeSystem#ihe-iid "IHE IID endpoint"

 



* payloadType 1..1
  * text = "IHE IID"
* payloadMimeType
  * insert SliceElement( #value, $this )
* payloadMimeType contains 
    text-html 1..1
* payloadMimeType[text-html] = #text/html


* address 1..1
