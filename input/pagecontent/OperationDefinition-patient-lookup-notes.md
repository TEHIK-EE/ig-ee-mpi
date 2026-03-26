Näide päringust:
```
GET {MPI}/Patient/$lookup?identifier=https://fhir.ee/sid/pid/est/ni|52007010062&source=https://rahvastikuregister.ee
```
Vastus
```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "899",
        "meta": {
          "lastUpdated": "2024-08-05T08:44:24.072+03:00",
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
          ]
        },
        "identifier": [
          {
            "system": "https://fhir.ee/sid/pid/est/ni",
            "value": "52007010062"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "KIVI",
            "given": [
              "CARL"
            ]
          }
        ],
        "gender": "male",
        "birthDate": "2020-07-01",
        "address": [
          {
            "extension": [
              {
                "url": "http://hl7.org/fhir/StructureDefinition/address-official",
                "valueBoolean": true
              },
              {
                "url": "https://fhir.ee/base/StructureDefinition/ee-ads-adr-id",
                "valueCoding": {
                  "system": "https://fhir.ee/base/CodeSystem/ads-adr-id",
                  "code": "2187800"
                }
              },
              {
                "url": "https://fhir.ee/base/StructureDefinition/ee-ads-oid",
                "valueCoding": {
                  "system": "https://fhir.ee/base/CodeSystem/ads-oid",
                  "code": "ER01392274"
                }
              }
            ],
            "use": "home",
            "type": "physical",
            "text": "Harju maakond, Tallinn, Lasnamäe linnaosa, Virbi tn 2-99",
            "line": [
              "Virbi tn 2 - 99"
            ],
            "_line": [
              {
                "extension": [
                  {
                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
                    "valueString": "Virbi tn"
                  },
                  {
                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
                    "valueString": "2"
                  },
                  {
                    "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator",
                    "valueString": "99"
                  }
                ]
              }
            ],
            "city": "Tallinn",
            "state": "Harju maakond",
            "postalCode": "13629",
            "country": "EE",
            "period": {
              "start": "2024-01-12T00:00:00+02:00"
            }
          }
        ]
      }
    }
  ]
}
```