Profile: ImWadoEndpoint
Parent: EndpointEu
Title: "IM WADO Endpoint"
Description: """
This profile defines the WADO endpoint for accessing imaging study content.
"""
* insert SetFmmAndStatusRule( 1, "draft" )



* extension contains
  $cvEndpoint-connectionType named connectionType 1..1
* extension[connectionType] 
  * insert SliceElement( #value, coding )
* extension[connectionType] contains wado 1..1
* extension[connectionType][wado].coding = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"

* payloadType 1..1
* payloadType= http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"

* payloadMimeType 1..1
* payloadMimeType
  * insert SliceElement( #value, $this )
* payloadMimeType contains
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
* payloadMimeType[dicom]           = #application/dicom
* payloadMimeType[dicom-octet]     = #application/octet-stream
* payloadMimeType[dicom-xml]       = #application/dicom+xml
* payloadMimeType[dicom-json]      = #application/json
* payloadMimeType[image-jpg]       = #image/jpg
* payloadMimeType[image-gif]       = #image/gif
* payloadMimeType[image-jp2]       = #image/jp2
* payloadMimeType[image-jph]       = #image/jph
* payloadMimeType[image-jxl]       = #image/jxl
* payloadMimeType[video-mpeg]      = #video/mpeg
* payloadMimeType[video-mp4]       = #video/mp4
* payloadMimeType[video-H265]      = #video/H265
* payloadMimeType[text-html]       = #text/html
* payloadMimeType[text-plain]      = #text/plain
* payloadMimeType[text-xml]        = #text/xml
* payloadMimeType[text-rtf]        = #text/rtf
* payloadMimeType[application-pdf] = #application/pdf
