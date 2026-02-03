#### Kohustuslik põhjendus
Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhejndus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

### Päring
`GET [base]/Patient/$legal-relationship?patient=Patient/8356&relationship-type=http://terminology.hl7.org/CodeSystem/v3-RoleClass%7CGUARD&relationship-type=http://snomed.info/sct%7C127848009&custody-type=H20&custody-type=H10`- 

- sama parameetri võib esineda mitu korda (OR loogika)
- `relationship-type` - tuleb määrata alati koos koodisüsteemiga

#### Näide vastusest #1
{% fragment Observation/LegalRelationship1 JSON %}

#### Näide vastusest #2
{% fragment Observation/LegalRelationship2 JSON %}
