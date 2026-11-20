#### Kohustuslik põhjendus

Antud päring nõuab **x-road-issue** HTTP päise lisamist. Põhjendus on nähtav patsiendile eesti.ee portaalis Andmejälgija kaudu.

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

Sama parameeter võib esineda mitu korda (rakendatud OR loogika).

#### Vahemälu (cache)

Seosed päritakse Rahvastikuregistrist ja salvestatakse MPI andmebaasi. Vaikimisi tagastab MPI salvestatud andmed. Rahvastikuregistrisse tehakse päring ainult siis, kui patsiendi seoseid ei ole sealt veel kordagi päritud.

Värskete andmete saamiseks:

- parameeter `nocache=true` või päis `Cache-Control: no-cache`: MPI teeb alati uue päringu Rahvastikuregistrisse;
- päis `Cache-Control: max-age=N`: MPI teeb uue päringu, kui andmed on Rahvastikuregistrist päritud rohkem kui N sekundit tagasi.

Kasuta neid, kui on oluline saada Rahvastikuregistrist kõige värskemad andmed, nt kui andmed võivad olla hiljuti muutunud.

#### Näited

Näide päringust, kus soovime leida kõiki isikuid, kellega patsiendil on kas GUARD tüüpi suhe või 67822003 tüüpi suhe ning kellel on H20 või H10 tüüpi hooldusõigus:

```Patient/$legal-relationship?relationship-type=http://terminology.hl7.org/CodeSystem/v3-RoleClass%7CGUARD&relationship-type=http://snomed.info/sct%7C67822003&custody-type=H20&custody-type=H10&patient=Patient/pat1 ```


Näide vastusest:

{% include Bundle-patient-legal-relationship-example-json-html.xhtml %}
