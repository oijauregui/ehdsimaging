Profile: ImWadoEndpointProvider
Parent: ImWadoEndpoint
Id: im-wado-endpoint-provider
Title: "WADO endpoint (ImProvider)"
Description: """ImProvider requirements for WADO endpoints."""
* insert SetFmmAndStatusRule( 1, "draft" )
* meta.security
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* language
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* status
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )

* name
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* description
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )
* managingOrganization
  * insert SetObligation( #SHALL:populate-if-known, ImProvider, [[]], [[]] )

Profile: ImWadoEndpoint
Parent: Endpoint
Id: im-wado-endpoint
Title: "WADO endpoint"
Description: """
This profile defines the WADO endpoint for accessing imaging study content.
"""
* insert SetFmmAndStatusRule( 1, "draft" )

* status

* connectionType 
  * insert SliceElement( #value, coding )
* connectionType contains wado 1..1
* connectionType[wado] = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"

* name
* description 0..1
* managingOrganization 0..1
* payload
  * insert SliceElement( #value, type )
* payload contains wadors 1..1
* payload[wadors]
  * type 1..1
  * type = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
  * mimeType
    * insert SliceElement( #value, $this )
  * mimeType contains 
      // source dicom
      dicom 1..1 and 
      dicom-octet 1..1 and
      dicom-xml 1..1 and 
      dicom-json 1..1 and 
      // image
      image-jpg 1..1 and
      image-gif 1..1 and
      image-jp2 1..1 and
      image-jph 1..1 and
      image-jxl 1..1 and
      // multiframe
      // image-gif 0..1 and
      // image-jxl 0..1 and
      // video
      video-mpeg 1..1 and
      video-mp4 1..1 and
      video-H265 1..1 and
      // text
      text-html 1..1 and
      text-plain 1..1 and
      text-xml 1..1 and  
      text-rtf 1..1 and
      application-pdf 1..1

  * mimeType[dicom]           = #application/dicom
  * mimeType[dicom-octet]     = #application/octet-stream
  * mimeType[dicom-xml]       = #application/dicom+xml
  * mimeType[dicom-json]      = #application/json
  * mimeType[image-jpg]       = #image/jpg
  * mimeType[image-gif]       = #image/gif
  * mimeType[image-jp2]       = #image/jp2
  * mimeType[image-jph]       = #image/jph
  * mimeType[image-jxl]       = #image/jxl
  * mimeType[video-mpeg]      = #video/mpeg
  * mimeType[video-mp4]       = #video/mp4
  * mimeType[video-H265]      = #video/H265
  * mimeType[text-html]       = #text/html
  * mimeType[text-plain]      = #text/plain
  * mimeType[text-xml]        = #text/xml
  * mimeType[text-rtf]        = #text/rtf
  * mimeType[application-pdf] = #application/pdf

