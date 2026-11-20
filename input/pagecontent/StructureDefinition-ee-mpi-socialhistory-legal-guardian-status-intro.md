Observation tagastatakse [$legal-guardian](OperationDefinition-patient-legal-guardian.html) operatsiooniga. Iga eestkoste seose kohta tagastatakse eraldi Observation.

| Element | `legal-status=58626002` (patsiendi eestkostjad) | `legal-status=365569001` (patsiendi eestkostetavad) |
|---|---|---|
| `code` | SNOMED CT 58626002 | SNOMED CT 58626002 |
| `subject` | päringus antud patsient | päringus antud patsient |
| `performer` | eestkostja: contained RelatedPerson (`relationship` = GUARD) või asutus, nt KOV (contained Organization) | eestkostetav: contained RelatedPerson (`relationship` = DEPEN) |
| `value` | 58626002 „Legal guardian“ – performer on patsiendi eestkostja | 365569001 „Finding of wardship“ – performer on patsiendi eestkostetav |

`value` kirjeldab seega alati performeri rolli patsiendi suhtes, mitte patsiendi rolli.
