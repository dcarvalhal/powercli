
#Conectar no vCenter
$vicredential = (Get-Credential -Credential dcarvalhal@atl1.local)
Connect-VIServer 10.200.10.8 -Credential $vicredential