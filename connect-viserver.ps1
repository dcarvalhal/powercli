$vicredential = (Get-Credential -Credential administrator@vsphere.local)
Connect-VIServer "192.168.1.61" -Credential $vicredential
