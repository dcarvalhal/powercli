# vCenter Server #
$vcenterServer = "192.168.1.61"

# Conecta no vCenter Server - ServerCentral #
Connect-VIServer $vcenterServer
 
# Busca os hosts ESXI #
$esxis = get-vmhost | Sort-Object name
 
# Executa o rescan nas HBAs e o rescan dos vmfs em cada hosts - Com um spleep de 60 segundos entre os hosts #
foreach ($esxi in $esxis)
	{
	write-host "Scan all HBAs on "$esxi
	get-VMHostStorage -VMHost $esxi -RescanAllHba
    write-host "Rescan VMFS on "$esxi
    get-VMHostStorage -VMHost $esxi -RescanVmfs
    Start-Sleep -s 60
	}
# Desconecta do vCenter Server #
Disconnect-VIServer -confirm:$false