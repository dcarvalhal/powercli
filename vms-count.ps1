$hosts = Get-vmhost | Select-Object Name

 foreach ($h in $hosts) {
    $vms = Get-VMHost $h.Name | get-vm | where {$_.PowerState -eq "PoweredOn"}
    Write-Host -ForegroundColor Yellow "Host ESXi =>" $h.Name "### Quantidade de vms ligadas =>" $vms.count
    #Write-Host "Quantidade de vms =>" $vms.count
}
$vmsligadas = get-vm | where {$_.PowerState -eq "PoweredOn"}
$vmsligadas.count >> "C:\Users\daniel.carvalhal\Documents\scripts-output\vms-ligadas.txt"
Write-Host -ForegroundColor Blue "Quantidade de vms ligadas =>" $vmsligadas.count
$vmsdesligadas = get-vm | where {$_.PowerState -eq "PoweredOff"}
$vmsdesligadas.count >> "C:\Users\daniel.carvalhal\Documents\scripts-output\vms-desligadas.txt"
Write-Host -ForegroundColor Blue "Quantidade de vms ligadas =>" $vmsdesligadas.coun