#Conectar no vCenter Server de Produção
Connect-Viserver 172.17.35.35

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

#Remove dos discos Raw Device
get-harddisk -VM $vms | where {$_.DiskType -eq "RawPhysical"}| Remove-HardDisk -DeletePermanently -Confirm:$false

#Desconectar do vCenter Server de Produção
Disconnect-VIServer $Global:DefaultVIServers -Confirm:$false