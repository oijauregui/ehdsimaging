RuleSet: SetFmmAndStatusRule ( fmm, status )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}

RuleSet: SetPopulateIfKnown
* ^extension[http://hl7.org/fhir/StructureDefinition/obligation].extension[code].valueCode = #SHALL:populate-if-known
* ^extension[http://hl7.org/fhir/StructureDefinition/obligation].extension[actor].valueCanonical = Canonical(ImProducer)
  
RuleSet: RequireField( field, cardinality )
* {field} {cardinality} MS
  * insert SetPopulateIfKnown

RuleSet: ExtensionContext(path)
// copied by mCode
* ^context[+].type = #element
* ^context[=].expression = "{path}"
