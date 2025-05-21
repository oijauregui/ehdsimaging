Profile: ImImageIidViewerEndpoint
Parent: EndpointEu
Title: "IM Image Viewer Endpoint"
Description: """
This profile defines a placeholder for an Endpoint for a viewer that can be used to access the study, serie it is present on.
The application is based on [IHE-IID](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf).
"""
* insert SetFmmAndStatusRule( 1, "draft" )

{% if isR5 %}
* connectionType 
  * insert SliceElement( #value, coding )
* connectionType contains iid 1..1
* connectionType[iid] = Hl7EuImagingEndpointTerminologyCodeSystem#ihe-iid "IHE IID endpoint"
{% endif %}

{% if isR4  %}
* extension contains
  $cvEndpoint-connectionType named connectionType 1..*
  * extension[connectionType] 
    * insert SliceElement( #value, coding ) 
  * extension[connectionType] contains iid 1..1
  * extension[connectionType][iid] = Hl7EuImagingEndpointTerminologyCodeSystem#ihe-iid "IHE IID endpoint"
{% endif %}
 
{% if isR5 %}
* payload 1..*
* payload
  * type 1..1
    * text = "IHE IID"
  * mimeType
    * insert SliceElement( #value, $this )
  * mimeType contains 
      text-html 1..1
  * mimeType[text-html] = #text/html
{% endif %}

{% if isR4 %}
* payloadType 1..1
  * text = "IHE IID"
* payloadMimeType
  * insert SliceElement( #value, $this )
* payloadMimeType contains 
    text-html 1..1
* payloadMimeType[text-html] = #text/html
{% endif %}

* address 1..1

