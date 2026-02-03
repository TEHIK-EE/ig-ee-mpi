#### Kohustuslik põhjendus

Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhejndus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

### Päring

`GET [base]/Patient/$legal-relationship?{parameters}`

#### Päringu parameetrite lisa-kirjeldus
- `relationship-type` - suhte tüüp, mille kohta soovitakse märkusi pärida. Lubatud väärtused
  valueset-ist: https://fhir.ee/ValueSet/isiku-suhte-tyybid-hl7-ja-snomed
    - Näide: `http://terminology.hl7.org/CodeSystem/v3-RoleClass|GUARD` või `http://snomed.info/sct|127848009`
    - Ei ole lubatud määrata ilma koodisüsteemita.
- `custody-type` - hooldusõiguse liik isikute vahel mida soovitakse pärida. Lubatud väärtused valueset-ist: https://fhir.ee/ValueSet/hooldusoiguse-liik
    - Näide: `H20` (täielik isikuhooldusõigus)
    - Lubatud määrata ilma koodisüsteemita.

Sama parameetri võib esineda mitu korda (rakendatud OR loogika).

#### Näide päringust

`GET [base]/Patient/$legal-relationship?patient=Patient/8356&relationship-type=http://terminology.hl7.org/CodeSystem/v3-RoleClass%7CGUARD&relationship-type=http://snomed.info/sct%7C127848009&custody-type=H20&custody-type=H10`

#### Näide vastusest #1

{% fragment Observation/LegalRelationship1 JSON %}

#### Näide vastusest #2

{% fragment Observation/LegalRelationship2 JSON %}
