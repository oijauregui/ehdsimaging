The figure below presents the eHN DataSet representation and the FHIR profiles it maps to. For each FHIR profile the impacted fields are listed.

```mermaid
classDiagram
    class HealthInsurranceAndPayment{
        <<eHN DataSet>>
        providerCode
        providerName
        provideNumber
    }
    class ImCoverage{
        <<Coverage>>
        identifier
        insurer
    }
    class ImHealthInsurerProvider{
        <<Organization>>
        name
        insurer
    }
    class ImOrder{
        <<ServiceRequest>>
        insurance
    }
    class ImComposition{
        <<Composition>>
        section[order].entry[order]
        section[order].entry[insurrance]
        section[order].entry[insurranceprovider]
    }
    HealthInsurranceAndPayment --|> ImCoverage
    HealthInsurranceAndPayment --|> ImHealthInsurerProvider
    HealthInsurranceAndPayment --|> ImOrder
    HealthInsurranceAndPayment --|> ImComposition
    
    ImCoverage --> ImHealthInsurerProvider: insurer
    ImOrder --> ImCoverage: insurance
    ImComposition --> ImOrder: section[order].entry[order]
    ImComposition --> ImCoverage: section[order].entry[insurrance]
    ImComposition --> ImHealthInsurerProvider: section[order].entry[insyrranceprovider]

```

