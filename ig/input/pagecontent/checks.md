### Üldised kontrollid

Kõik päringus ja ressurssid peavad järgima FHIR spetsifikatsiooni.

Sissetulevad päringud ja andmed valideeritakse:
- FHIR spetsifikatsiooni üldiste reeglite ja loendite vastu
- PÜT profiilide vastu
- PÜT rakenduse poolt lubatud tegevuste nimekirja vastu (nimekiri tegevustest leitav CapabilityStatement-is aadressil $mpi-url/fhir/metadata)
- Kontrollitakse kasutatavat terminoloogiat profiilide ja terminoloogia serveri vastu
- Autoriseerimisserveri vastu, tegevust saab teostada ainult kasutaja vastava rolli olemasolul

### PÜT rakenduse sisesed kontrollid
#### Telefonid
siia tuleb tabel 
Telefoninumbrid
https://www.riigiteataja.ee/akt/881042 - eesti numeratsiooniplaan
Eesti lauatelefoni number	
`^(32|33|35|38|39|6[0-9]|7[1-9]|88)(\d{5})$`
Eesti riigi kood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati koodiga +372.

Eesti mobiiltelefoni number	
`^5[0-9](\d{5,6})$`
Eesti riigi kood kujul +372 või 00372 ignoreeritakse valideerimisel, kuid salvestatakse alati koodiga +372.

Välimsaa telefoni number	
`^\+[1-9]\d{1,14}$`
Kontrollitakse ainult pikkust ja riigi koodi olemasolu. Teiste riikide reegleid ei rakendata numbri valideerimisel.


Salvestatkse alati riigi koodiga kujul +XXXYYYYYY ilma tühikudeta ja sulgudeta. Juhul kui MPI'sse jõuab valiidne eesti number ilma riigikoodita, siis seda lisatakse.

#### Emailid

Emaili valideeritakse regexi järgi
`^(?=.{1,64}@)[A-Za-z0-9_+-]+(\.[A-Za-z0-9_+-]+)*@[^-][A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,})$`

Salvestatakse ainult valiidsed aadressid muutumata kujul

