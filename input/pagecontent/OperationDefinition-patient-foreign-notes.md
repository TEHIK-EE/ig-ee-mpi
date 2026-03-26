#### Näited
Näide päringust: 
 ```
GET {MPI}/Patient/$foreign?gender=male&birthdate=1979-12-25&family=Graham&given=Gene&identifier_country=UZB&telecom=%2B1234567
```

Vastusena tuleb (collection) Bundle mis tagastab kollektsiooni leitud ressurssidest (ilma metainformatsioonita):

```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "895",
        "meta": {
          "lastUpdated": "2024-08-05T08:41:32.120+03:00",
          "profile": [
            "https://fhir.ee/mpi/StructureDefinition/ee-mpi-patient-verified"
          ]
        },
        "identifier": [
          {
            "system": "https://fhir.ee/sid/pid/uzb/ppn",
            "value": "113354925133"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "Graham",
            "given": [
              "Gene"
            ]
          }
        ],
        "telecom": [
          {
            "system": "phone",
            "value": "+1234567",
            "period": {
              "start": "2024-08-05T08:41:32+03:00"
            }
          }
        ],
        "gender": "male",
        "birthDate": "1979-12-25"
      }
    }
  ]
}
```