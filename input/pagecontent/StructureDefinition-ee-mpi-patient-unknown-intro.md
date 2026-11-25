Tundmatut ja anonüümset patsienti PÜT ei erista: mõlemad salvestatakse selle profiiliga.

### Ligikaudne vanus

Laiendusi `birthDate.extension:age` ja `birthDate.extension:accuracyIndicator` PÜT ei salvesta ega tagasta. PÜT salvestab sünnikuupäeva koos selle täpsusega, seega edastatakse ligikaudne vanus ebatäpse sünnikuupäevana:

- `"birthDate": "1980"` – teada on ainult aasta;
- `"birthDate": "1980-05"` – teada on aasta ja kuu.
