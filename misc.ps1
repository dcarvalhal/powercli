$vms = get-cluster Red | get-vm | where {$_.Name -like "*spv*"}
Move-VM -VM $vms -Destination Blue

Move-VM myVM0 -Destination (Get-Cluster myDestDRSCluster | Get-VMHost | ?{$_.State -eq "Connected"} | Get-Random) -RunAsync

$vms = get-vm -Location "Glias" | where {$_.Name -like "*01*"}
Start-VM $vms -Confirm -RunAsync
get-vm $vms | Shutdown-VMGuest

$vms = get-cluster Blue | get-vm | Select Name, Folder


$vms = get-vm -Location Blue | Where-Object {$_.Folder -like "*Aut*"}