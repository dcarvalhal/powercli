$vmsblue = get-vm -Location Blue | Select-Object Name, Folder

write-host "################################################" -ForegroundColor "Blue"
$vmsblue | Sort-Object Folder

$vmsProduction1 = get-vm -Location ClusterProduction1 | Select-Object Name, Folder

write-host "################################################" -ForegroundColor "Blue"
$vmsProduction1 | Sort-Object Folder

write-host "################################################" -ForegroundColor "Blue"

write-host "VMs cluster Blue" -ForegroundColor "green"
$vmsblue.count
write-host "VMs cluster Production1" -ForegroundColor "green"
$vmsProduction1.count