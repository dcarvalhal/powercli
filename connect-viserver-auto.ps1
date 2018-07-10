
#Conectar no vCenter
$vicredential = Get-Credential
Connect-VIServer 10.200.10.8 -Credential $vicredential