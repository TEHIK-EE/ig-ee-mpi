### Patsientide sidumine
Tehakse [$link operatsiooniga](OperationDefinition-patient-link.html)

#### Reeglid ja piirangud
- "target" on primaarne patsient, kes jääb peale sidumist aktiivseks.
- "source" on sekundaarne patsient, kes muutub mitteaktiivseks.
- Sidumine sekundaarne patsient peab olema aktiivne.
- Eesti isikukoodiga patsient peab olema alati primaarne patsient.
- Kahte eesti isikukoodiga patsienti ei saa siduda, isikukoodi muudatus tuleb Rahavastikuregistri kaudu automaatselt.
- Kui sidumisel on mõlemal patsiendil sama süsteemiga identifikaatorid (näiteks mõlemal on soome isikukood), siis sekundaarse patsiendi identifikaatorile pannakse lõppkuupäev (ka eesti isikukoodi puhul).
- Sidumise tulemused hoitakse `Patient.link` elemendis.
- `Patient` ressurssi salvestamisel rakendus ignoreerib `link` elemendi sisu. Välja `link` saab muuta ainult operatsioonide abil.
- Saab siduda mitu sekundaarset patsienti ühe primaarse patsiendiga (sel juhul tekib mitu `Patient.link` elementi primaarse patsiendil).


### Patsientide lahti sidumine
Tehakse [$unlink operatsiooniga](OperationDefinition-patient-unlink.html)

#### Reeglid ja piirangud
- Lahti sidumisel patsiendid peavad olema seotud (`Patient.link` element on täidetud).
- "target" patsient on mitteaktiivne ressurss, mis muutub aktiivseks peale lahti sidumist.
- Peale lahti sidumist on eemaldatakse lingid (`Patient.link`) kahe patsiendi vahel.

### Linkide kasutamine teises FHIR serveris (visioon)
Tüüpiline päring FHIR serveris Observation ressurssi vastu näeb välja nii:
```
[fhir-server-base]/Observation?patient=123
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 3,
   ..K, O, D
}
 
[fhir-server-base]/Observation?patient=789
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 5,
  ..A, L, I, T, Y
}
```
, kus 123 ja 789 on patsiendi refererence-id (või teiste sõnadega patsiendi id MPI-s). Oletame, et esimesel patsiendi on identifikaator UK123 ja teisel on EE789. Siis päring identifikaatori kohta annab samad tulemused:

```
[fhir-server-base]/Observation?patient.identifier=UK123
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 3,
  ..K, O, D
}
 
[fhir-server-base]/Observation?patient.identifier=EE789
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 5,
  ..A, L, I, T, Y
}  
```

Peale patsientide sidumist:
```
POST [mpi]/Patient/$link
[some headers]
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "source-patient",
      "valueReference": {
          "reference": "Patient/123"
      }      
    },
    {
      "name": "destination-patient",
      "valueReference": {
          "reference": "Patient/789"
      }
    }
  ]
}
```

Esimene patsient muutub mitteaktiivseks ja tal tekib link teisele patsiendile koos tunnusega, et ta on asendatud:
```
GET [fhir-server-base]/Patient/123
[some headers]
{
  "id": "123",
  "active": false,
  ...
  "link": [
    {
      "other": {
        "reference": "Patient/789"
      }
    },
    "type": "replaced-by"
    }
  ]
}
```

ning teisel patsiendil tekib link esimesele patsiendile koos tunnusega, et ta on seda asendanud:
```
GET [fhir-server-base]/Patient/789
[some headers]
{
  "id": "789",
  ...
  "link": [
    {
       "other": {
        "reference": "Patient/123"
      }
    },
    "type": "replaces"
    }
  ]
}
```

Antud muudatused ei muuda andmeid lähteregistrites, st et päringud id järgi annavad endiselt samu tulemusi:
```
[fhir-server-base]/Observation?patient=123
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 3,
  ..K, O, D
}
 
[fhir-server-base]/Observation?patient=789
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 5,
  ..A, L, I, T, Y
}  
```

Tänu sidumisele leiab päring identifikaatori järgi mitte ühe patsiendi id vaid kahe ning päring nii ühe kui teise identifikaatori järgi tagastab sama andmehulga:
```
[fhir-server-base]/Observation?patient.identifier=UK123
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 8,
  ..K, O, D, A, L, I, T, Y
}

[fhir-server-base]/Observation?patient.identifier=EE789
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 8,
  ..K, O, D, A, L, I, T, Y
}  
```

Juhul kui sidumine oli tehtud ekslikult ja need kaks patsienti tuleb lahti ühendada, siis kasutatakse unlink operatsiooni:
```
POST [mpi]/Patient/$unlink
[some headers]
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "source-patient",
      "valueReference": {
          "reference": "Patient/123"
      }      
    },
    {
      "name": "destination-patient",
      "valueReference": {
          "reference": "Patient/789"
      }      
    }
  ]
}
```
Selle tulemusena lingid kahe patsiendi vahel kustutatakse ning lähte (source) patsient (123) muutub uuesti aktiivseks. Ühtlasi Observation päringud identifikaatorite järgi tagastavad uuesti 3 kirjet Patient/123 puhul ja 5 kirjet Patient/789 puhul.


### Liitmine (Merge) 
Kuigi FHIR API-s esineb patsiendi ühendamise operatsioon *[http://hl7.org/fhir/OperationDefinition/Patient-merge](http://hl7.org/fhir/patient-operation-merge.html), mis liidab kahe patsiendi andmed jäädavalt (liidetav kaotatakse ära).
MPI ei paku antud operatsiooni patsientide liitmiseks, kuna ta ei ole tagasipööratav.

### Teised ressursid
#### TIS
TIS võimaldab siduda patsiente. Selleks kasutatakse HL7 V3 sõnumit [PRPA_IN201102UV01_PatientLivingSubject_Information_Revised_dublikaadid](https://pub.e-tervis.ee/standards2/Standards/8.0/DL/XML/PRPA_IN201102UV01_PatientLivingSubject_Information_Revised_dublikaadid.xml). Hetkel TIS ei paku patsientide lahti sidumise teenust.
