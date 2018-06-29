$vmsblue = get-vm -Location Blue | Select-Object Name, Folder

$vmsblue | Sort-Object Folder

$vmsProduction1 = get-vm -Location Blue | Select-Object Name, Folder

$vmsProduction1 | Sort-Object Folder

write-host "VMs cluster Blue"
$vmsblue.count
write-host "VMs cluster Production1"
$vmsProduction1.count