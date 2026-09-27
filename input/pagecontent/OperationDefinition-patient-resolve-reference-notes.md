#### Päringu meetod
Toetatud on ainult `POST` päring, identifikaatorid edastatakse päringu kehas `Parameters` ressursina.

#### Identifikaatori valideerimine
`identifier.system` peab kuuluma väärtushulka [patsiendi-identifikaatorite-domeen](https://akk.tehik.ee/classifier/fhir/ValueSet/patsiendi-identifikaatorite-domeen). Lubatud on nii URL (nt `https://fhir.ee/sid/pid/est/ni`) kui ka OID (nt `urn:oid:1.3.6.1.4.1.28284.6.2.2.16.246.2`) kujul süsteemid.

#### Näited
Näide päringust:
```
POST {MPI}/Patient/$resolve-reference
```
```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "identifier",
      "valueIdentifier": {
        "system": "https://fhir.ee/sid/pid/est/ni",
        "value": "37302102711"
      }
    },
    {
      "name": "identifier",
      "valueIdentifier": {
        "system": "urn:oid:1.3.6.1.4.1.28284.6.2.2.16.752.2",
        "value": "SWE-12345567"
      }
    },
    {
      "name": "identifier",
      "valueIdentifier": {
        "system": "https://fhir.ee/sid/pid/est/ni",
        "value": "49010012345"
      }
    },
    {
      "name": "identifier",
      "valueIdentifier": {
        "system": "https://example.com/unknown-system",
        "value": "12345678901"
      }
    }
  ]
}
```

Vastusena tuleb iga identifikaatori kohta `match`, mis sisaldab kas viidet leitud patsiendile (`patient`) või `issue` osa: hoiatus (`warning`), kui patsienti ei leitud (`MPI-021`), või viga (`error`), kui identifikaatori süsteem ei ole lubatud (`MPI-067`). Vastust tuleb päringuga siduda `match.identifier` järgi. Vastus on alati HTTP 200 koos `Parameters` ressursiga, ka siis, kui ühegi identifikaatori kohta patsienti ei leitud:

{% include Parameters-patient-resolve-reference-example-json-html.xhtml %}

#### Vead
Kui päringus puudub `identifier` parameeter, tagastatakse viga `MPI-078`:

```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "severity": "error",
      "code": "required",
      "details": {
        "coding": [
          {
            "system": "https://mpi.tehik.ee",
            "code": "MPI-078"
          }
        ],
        "text": "Puudub kohustuslik 'identifier' parameeter"
      }
    }
  ]
}
```
