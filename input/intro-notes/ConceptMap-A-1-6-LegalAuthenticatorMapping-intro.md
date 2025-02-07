This ConceptMap maps section A.1.7 of the eHN logical model on the IG FHIR model.

```mermaid
classDiagram
    class LegalAuthenticator{
        <<eHN DataSet>>
        authenticatorIdentifier
        authenticatorName
        authenticatorOrganization
        authenticatorDateTime
    }
    class ImLegalAuthenticator{
        <<PractitionerRole>>
        identifier
        practitioner
        organization
    }
    class ImPractitioner{
        <<Practitioner>>
        identifier
        name
    }
    class ImOrganization{
        <<Organization>>
        name
    }
    class ImComposition{
        <<Composition>>
        attester[legalauthenticator].party
        attester[legalauthenticator].time
        attester[legalauthenticator].code = #legal
    }
    class ImDiagnosticReport{
        <<Diagnosticreport>>
        issued
    }
    LegalAuthenticator --|> ImLegalAuthenticator
    LegalAuthenticator --|> ImPractitioner
    LegalAuthenticator --|> ImOrganization
    LegalAuthenticator --|> ImComposition
    LegalAuthenticator --|> ImDiagnosticReport
    
    ImComposition --> ImLegalAuthenticator: atterster.party    
    ImLegalAuthenticator --> ImPractitioner: practitioner
    ImLegalAuthenticator --> ImOrganization: organization
    
```
