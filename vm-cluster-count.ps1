$vmsblue = get-vm -Location Blue | Select-Object Name, Folder
#$vmsblue | Sort-Object Folder
$vmsProduction1 = get-vm -Location ClusterProduction1 | Select-Object Name, Folder
#$vmsProduction1 | Sort-Object Folder
write-host "VMs cluster Blue" -ForegroundColor "green"
$vmsblue.count
write-host "VMs cluster Production1" -ForegroundColor "green"
$vmsProduction1.count
write-host "################################################" -ForegroundColor "Blue"
$vmsblue | Sort-Object Folder