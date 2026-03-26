Näide sidumise päringust ```Patient/$link```, kus on määratud nii source kui ka target patsiendi identifikaatorid:
```json
{
    "resourceType": "Parameters",
    "id": "example",
    "parameter": [
        {
            "name": "source-patient",
            "valueReference": {
                "reference": "Patient/1937470"
            }
        },
        {
            "name": "target-patient",
            "valueReference": {
                "reference": "Patient/1937482"
            }
        }
    ]
}
```

Näide vastusest:
```json
{
  "resourceType": "Patient",
  "id": "1937482",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2026-03-18T13:43:05.429+02:00",
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
      "value": "5356221787246",
      "period": {
        "end": "2026-03-18T13:46:57+02:00"
      }
    },
    {
      "system": "https://fhir.ee/sid/pid/fin/ni",
      "value": "145273556776"
    },
    {
      "system": "https://fhir.ee/sid/pid/bra/ni",
      "value": "BRA-145273556776"
    }
  ],
  "active": true,
  "name": [
    {
      "use": "official",
      "family": "Bond",
      "given": [
        "James"
      ]
    }
  ],
  "gender": "male",
  "birthDate": "1974-12-25",
  "link": [
    {
      "other": {
        "reference": "Patient/1937470"
      },
      "type": "replaces"
    }
  ]
}
```