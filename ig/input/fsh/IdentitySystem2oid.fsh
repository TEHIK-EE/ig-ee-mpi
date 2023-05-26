Alias: $usage-context-type = http://terminology.hl7.org/CodeSystem/usage-context-type

Instance: identity-system-to-oid
InstanceOf: ConceptMap
Usage: #definition
* url = "https://fhir.ee/ConceptMap/identity-system-to-oid"
* version = "1.0.0"
* name = "IdentitySystemToOID"
* title = "Mapping of Identity System to OID"
* status = #draft
* experimental = true
* date = "2023-05-26"
* publisher = "TEHIK"
* description = "A mapping between the Identity System for person identification and ENHIS OID systems"
* useContext.code = $usage-context-type#venue
* useContext.valueCodeableConcept.text = "for NHIS usage"
* jurisdiction = urn:iso:std:iso:3166#EE
//* copyright = "Creative Commons 0"
* sourceScopeUri = "https://fhir.ee/ValueSet/ee-patient-identity"
* targetScopeUri = "urn:oid:1.3.6.1.4.1.28284"
* group.source = "https://fhir.ee/CodeSystem/ee-identity-system"
* group.target = "urn:oid:1.3.6.1.4.1.28284"
* group.element[0].code = #https://fhir.ee/sid/pid/afg/ppn
* group.element[=].display = "Passport number of Afghanistan"
* group.element[=].target.code = #urn:oid:1.3.6.1.4.1.28284.6.2.2.16.4
* group.element[=].target.relationship = #equivalent
* group.unmapped.mode = #use-source-code 
//* group.unmapped.code = #temp
//* group.unmapped.display = "temp"
* group.unmapped.relationship = #not-related-to