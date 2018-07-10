#Conectar no vCenter Server de Produção
& 'C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1'
$vicredential = Get-Credential
Connect-VIServer 172.17.35.35 -Credential $vicredential

$vms = @( 
    "DC1B4GIMDBP02",
    "DC1B4DB05P01",
    "DC1B4DB03P01",
    "DC1B4TESOUDBP01",
    "SCCHIB4VUM-01"
			 );

#Lista os discos Raw Device dos servidores impactados na mudança
$disk =@()
$disk += Get-HardDisk -VM $vms | where {$_.DiskType -eq "RawPhysical"} | Select Parent, Name, DiskType, Filename
$disk
$disk.count
#Remove dos discos Raw Device
#get-harddisk -VM $vms | where {$_.DiskType -eq "RawPhysical"}| Remove-HardDisk -DeletePermanently -Confirm:$false

#Desconectar do vCenter Server de Produção
Disconnect-VIServer $Global:DefaultVIServers -Confirm:$false