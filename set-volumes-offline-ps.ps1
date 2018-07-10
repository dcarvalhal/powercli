$GroupName = "WSB4PRODSTG"
$GroupAddress = "172.18.35.105"

$VolNames = @( 
    "Raw-DC1B4CIPDBP01-Data",
    "Raw-DC1B4CIPDBP01-Logs",
    "Raw-DC1B4DB03P01-Data-01",
    "Raw-DC1B4DB03P01-Data-02",
    "Raw-DC1B4DB03P01-Data-03",
    "Raw-DC1B4DB03P01-Data-04",
    "Raw-DC1B4DB03P01-Logs",
    "Raw-DC1B4GIMDBP02-Data",
    "Raw-DC1B4GIMDBP02-Logs",
    "Raw-DC1B4TESOUDBP01-Data",
    "Raw-DC1B4TESOUDBP01-Logs"
    		 );

Connect-EqlGroup -GroupName $GroupName -GroupAddress $GroupAddress -Credential (Get-credential)

Foreach ($VolName in $VolNames) {
    Set-EqlVolume -VolumeName $VolName -OnlineStatus offline
    } 

Disconnect-EqlGroup -GroupAddress $GroupAddress