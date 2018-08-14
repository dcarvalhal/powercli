# Busca os hosts ESXI #
$esxis = get-vmhost | Sort-Object name
 
# Executa o rescan nas HBAs e o rescan dos vmfs em cada hosts - Com um spleep de 30 segundos entre os hosts #
foreach ($esxi in $esxis)
	{
	write-host "Scan all HBAs on "$esxi
	Get-ScsiLun -VMHost $esxi -RescanAllHba
    	write-host "Rescan VMFS on "$esxi
    	Get-ScsiLun -VMHost $esxi -RescanVmfs
    	Start-Sleep -s 30
	}
# Desconecta do vCenter Server #
Disconnect-VIServer -confirm:$false
