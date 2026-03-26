Näide lahti sidumise päringust ```Patient/$unlink```, kus on määratud nii source kui ka target patsiendi identifikaatorid (samad, mis sidumisel kasutatud):
```json
{
  "resourceType": "Parameters",
  "id": "example",
  "parameter": [
    {
      "name": "source-patient",
      "valueReference": {
        "reference": "Patient/1937482"
      }
    },
    {
      "name": "target-patient",
      "valueReference": {
        "reference": "Patient/1937470"
      }
    }
  ]
}
```
Näidis vastusest:
```json
{
    "resourceType": "Patient",
    "id": "1937470",
    "meta": {
        "versionId": "1",
        "lastUpdated": "2026-03-18T13:42:33.754+02:00",
        "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
        ]
    },
    "identifier": [
        {
            "system": "https://fhir.ee/sid/pid/swe/ni",
            "value": "SWE-5356221787246"
        },
        {
            "system": "https://fhir.ee/sid/pid/fin/ni",
            "value": "5356221787246"
        }
    ],
    "active": true,
    "name": [
        {
            "use": "official",
            "family": "Võsaülane",
            "given": [
                "Tiit"
            ]
        }
    ],
    "telecom": [
        {
            "system": "phone",
            "value": "+37253535353",
            "use": "work",
            "rank": 1,
            "period": {
                "start": "2026-03-18T13:42:33+02:00"
            }
        }
    ],
    "gender": "male",
    "birthDate": "1974-12-25",
    "_birthDate": {
        "extension": [
            {
                "url": "http://hl7.org/fhir/StructureDefinition/patient-birthTime",
                "valueDateTime": "1974-12-25T22:35:45+03:00"
            }
        ]
    },
    "deceasedDateTime": "2003-12-25T21:35:45+02:00",
    "address": [
        {
            "extension": [
                {
                    "url": "https://fhir.ee/base/StructureDefinition/ee-ehak",
                    "valueCoding": {
                        "system": "https://fhir.ee/sid/ehak",
                        "code": "100300"
                    }
                },
                {
                    "url": "https://fhir.ee/base/StructureDefinition/ee-ads-adr-id",
                    "valueCoding": {
                        "system": "https://fhir.ee/base/CodeSystem/ads-adr-id",
                        "code": "111122"
                    }
                }
            ],
            "use": "home",
            "type": "both",
            "text": "534 Erewhon St PeasantVille, Rainbow, Vic  3999",
            "line": [
                "534 Erewhon St"
            ],
            "_line": [
                {
                    "extension": [
                        {
                            "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName",
                            "valueString": "Erewhon St"
                        },
                        {
                            "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber",
                            "valueString": "534"
                        },
                        {
                            "url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator",
                            "valueString": "110"
                        }
                    ]
                }
            ],
            "city": "PleasantVille",
            "state": "Vic",
            "postalCode": "3999",
            "country": "US",
            "period": {
                "start": "1974-12-25T00:00:00+03:00"
            }
        }
    ]
}
```