Käesolev juhend kirjeldab isikute identifitseerimise dokumenteerimise korda Eesti isikukoodiga, välisriigi isiku koodiga ning tundmatute ja surnult sündinute andmete edastamisel tervise infosüsteemi MPI teenusesse. Lisaks on selgitatud dubleerivate patsientide koodide sidumise lahendust.

### Identity system
Detailne info identifitseerimissüsteemi kohta on leitav [EEBase](https://fhir.ee/ig/ee-base/current/) juurutusjuhendis.

### Eesti isikukood
11-kohaline Eesti isikukood, mida kasutada patsiendi tuvastamiseks lahtris „isikukood“.
Patsienti identifitseeriv kood koos vastava OID-ga moodustab TIS-s terviku ehk unikaalse patsiendi koodi. Eesti isikukoodi puhul kasutada URL-i **https://fhir.ee/sid/pid/est/ni**. Eesti isikukoodi esitamise näide:
```json
  "identifier" : [
    {
      "system" : "https://fhir.ee/sid/pid/est/ni",
      "value" : "37302102711"
    }
  ]
```
NB! Siinkohal on oluline, et riigi valik saaks tehtud vastavalt dokumendi väljastanud riigile, mitte vastavalt rahvusele/kodakondsusele. Ehk, kui isikul on olemas Eesti isikukood, aga rahvuselt või kodakondsuselt on ta muu riigi kodanik, siis tuleb valida ikkagi Eesti riigi tunnus isikukoodi juures.

### Välisriigi isiku kood
Välisriigist pärit patsiendi puhul, kellel puudub Eesti isikukood ja kes on identifitseeritav mingi välisriigi dokumendi alusel, kasutada dokumenteerimiseks TIS-põhist välisriigi isiku URL-i (vastavad identifitseerimissüsteemid on kirjeldatud koodisüsteemis [Identifier Domain](https://fhir.ee/ig/terminology/current/site/CodeSystem-identifier-domain.html)). Siin on oluline meelde jätta, et eelviimane url-i komponent on kolmekohaline riigikood ja viimane on identifikaatori tüüp koodisüsteemist [v2-0203](http://terminology.hl7.org/CodeSystem/v2-0203). Olulisemad tüübid on:
- NI - riiklik identifikaator / nationanal identifier
- PPN - passi number / passport
- CZ - Id kaardi number / citezenship card number
- DL - juhiloa number / driver's licence number   

Identifitseerimissüsteemi kasutatakse väljal **system** ja identifikaatorit või passinumbrit väljal **value**. Täiendavalt saab määrata dokumendinumbri lõpukuupäeva.

Siinkohal on oluline, et riigi valik tehtaks vastavalt dokumendi väljastanud riigile, mitte vastavalt rahvusele/kodakondsusele. Eelistada dokumendil isikukoodi ID-d, selle puudumisel sisestada vastava dokumendi number.

Riikidel mille dokumentidel (PPN, CZ ja DL tüübiga) eksisteerib isikukood tuleb alati lisaks dokumendi numbrile määrata isikukood (identifikaator NI tüübiga). Loetelu nendest riikidest: [national-identifier-requirement](https://fhir.ee/ig/terminology/current/site/CodeSystem-national-identifier-requirement.html)

Välisriigi isiku esitamise näide, kus patsiendil on Soome isikukood ja USA pass:
```json
  "identifier" : [
    {
      "system" : "https://fhir.ee/sid/pid/fin/ni",
      "value" : "010199-000H",
      "display": "Soome isikukood"  

    },
    {
      "system" : "https://fhir.ee/sid/pid/usa/ppn",
      "value" : "KW039580340958",
      "period" : {
        "end" : "2023-12-28"
      },
      "display": "USA pass mis aegub 28.12.2023" 
    }
  ]
```

### Tundmatu isiku kood
Kui isikukood ei ole teada ehk tegemist on nö tundmatu isikuga, siis TTO saab pärida tundmatu isikkukoodi MPI-st kasutada operatsiooni [MR numbri genereerimiseks](OperationDefinition-patient-generate-mrn.html).
Genereeritud koodi saab kasutada koos **https://fhir.ee/sid/pid/est/mr** urliga.

Tundmatu isiku esitamise näide1:
```json
  "identifier" : [
    {
      "system" : "https://fhir.ee/sid/pid/est/mr",
      "value" : "00003352345",
      "display": "MPI poolt väljastatud identifikaator"      
    }
  ]
```

TTO saab kasutada ka enda poolt genereeritud identifikaatorit kasutades selleks oma asutuse jaoks mõeldud identifitseerimissüsteemi. URL TTO identifikaatori jaoks peab olema kujul **https://fhir.ee/sid/pid/est/prn/$BRcode**, kus $BRcode peab olema asendatud TTO Äriregistri koodiga. Kui asutuses on mitu infosüsteemi, mis genereerivad patsiendiidentifikaatorid siis koodide mitte kattuvus peab olema lahendatud asutusesiseselt.

Tundmatu isiku esitamise näide2:
```json
  "identifier" : [
    {
      "system" : "https://fhir.ee/sid/pid/est/prn/10856624",
      "value" : "123e4567-e89b-12d3-a456-426614174000",
      "display": "Rakvere Haigla patsiendi identifikaator"
    }
  ]
```

### Surnult sündinu kood
Sünniregistri poolt väljastatud kood surnult sündinute identifitseerimiseks.
Surnult sünni puhul antakse surnule spetsiaalne Eesti isikukoodi sarnane kood. Surnult sündinu kood esitatakse tervise infosüsteemis eraldi URL-iga "https://fhir.ee/sid/pid/est/". Surnult sünni puhul ei registreerita nime Rahvastikuregistris. Surnult sündinu esitamise näide:
```json
  "identifier" : [
    {
      "system" : "https://fhir.ee/sid/pid/est/npi",
      "value" : "49008201234",
      "display": "Surnult sündinu identifikaator"
    }
  ]
```


