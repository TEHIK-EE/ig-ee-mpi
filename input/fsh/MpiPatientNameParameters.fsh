Profile:        EEMPIPatientNameParameters
Parent:         Parameters
Id:             ee-mpi-patient-name-parameters
Title:          "EE MPI Patient Name Parameters"
Description:    "The patient's name returned by Patient/$name operation."

* parameter 1..*
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #open
* parameter contains name 1..* MS and warning 0..1 MS

* parameter[name].name = "name" (exactly)
* parameter[name].value[x] 1..1 MS
* parameter[name].value[x] only HumanName
* parameter[name].valueHumanName 1..1 MS
* parameter[name].valueHumanName.use 0..1 MS
* parameter[name].valueHumanName.text 0..1 MS
* parameter[name].valueHumanName.family 1..1 MS
* parameter[name].valueHumanName.given 1..* MS
* parameter[name].valueHumanName.prefix MS
* parameter[name].valueHumanName.suffix MS
* parameter[name].valueHumanName.period MS
* parameter[name].resource 0..0
* parameter[name].part 0..0

* parameter[warning].name = "warning" (exactly)
* parameter[warning].resource 1..1 MS
* parameter[warning].resource only OperationOutcome
* parameter[warning].value[x] 0..0
* parameter[warning].part 0..0


Instance: PatientNameParametersExample
InstanceOf: EEMPIPatientNameParameters
Description: "Example of patient name response"
Usage: #example

* parameter[name].name = "name"
* parameter[name].valueHumanName.use = #official
* parameter[name].valueHumanName.text = "Heli Kopter"
* parameter[name].valueHumanName.family = "Kopter"
* parameter[name].valueHumanName.given[0] = "Heli"