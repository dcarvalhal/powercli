$GroupName = "WSB4PRODSTG"
$GroupAddress = "172.18.35.105"

Connect-EqlGroup -GroupName $GroupName -GroupAddress $GroupAddress -Credential (Get-credential)

Disconnect-EqlGroup -GroupAddress $GroupAddress