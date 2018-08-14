write-host -f Green "$(Get-Date): Conectando no vCenter Server"
$vicredential = (Get-Credential -Credential administrator@vsphere.local)
Connect-VIServer "192.168.1.61" -Credential $vicredential

write-host -f Green "$(Get-Date): Executando o rescan nas HBAs e o rescan dos vmfs"
& 'C:\Users\dcarv\Documents\GitHub\powercli\rescan-all-storage.ps1'

Write-host -f Blue "$(Get-Date) : Fim do processo de rescan"
Disconnect-VIServer $sessions -Confirm:$false