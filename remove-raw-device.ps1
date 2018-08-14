#Conectar no vCenter Server de Produção
& 'C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1'
$vicredential = Get-Credential
Connect-VIServer 192.168.1.61 -Credential $vicredential

$vms = @( 
    "VM01",
    "VM02",
    "VM03",
    "VM04"
    	 );
#Lista os discos Raw Device dos servidores impactados.

$disk =@()
$disk += Get-HardDisk -VM $vms | where {$_.DiskType -eq "RawPhysical"} | Select Parent, Name, DiskType, Filename
$disk
$disk.count

#Output da execução
$disk > RawDisks.txt

Remove dos discos Raw Device
get-harddisk -VM $vms | where {$_.DiskType -eq "RawPhysical"}| Remove-HardDisk -DeletePermanently 

#Desconectar do vCenter Server de Produção
Disconnect-VIServer $Global:DefaultVIServers -Confirm:$false

