Alias: $mpi = https://mpi.tehik.ee

Instance: DeceasedWarning
InstanceOf: OperationOutcome
Usage: #example

* issue[0].severity = #warning
* issue[0].code = #informational
* issue[0].details.coding[0].system = $mpi
* issue[0].details.coding[0].code = #MPI-101
* issue[0].details.text = "Patsient on surnud"
