$report = @()
$vms = get-vm

Foreach ($vm in $vms) {
    $folderInfo = $vm.Folder | Select-Object Name
    $infovms = $vm | Get-View
    $info = {} | Select-Object "Display Name", Hostname, Folder, "Operational System", NumCPU, MemoryMB, IpAddress, Annotation, PowerState, Protected, "Hardware Virtual", "CPU HotAdd", "Memory HotAdd", "VMware Tools"    
        $info."Display Name" = $infovms.Name
        $info.Hostname = $infovms.Summary.Guest.HostName
        $info.Folder = $folderInfo.Name
        $info."Operational System" = $infovms.Summary.Guest.GuestFullName
        $info.NumCPU = $infovms.Config.Hardware.NumCPU
        $info.MemoryMB = $infovms.Config.Hardware.MemoryMB
        $info.IpAddress = $infovms.Summary.Guest.IpAddress
        $info.Annotation = $infovms.Config.Annotation
        $info.PowerState = $infovms.Runtime.PowerState
        $info.Protected = $infovms.Runtime.DasVmProtection.DasProtected
        $info."Hardware Virtual" = $infovms.Config.Version
        $info."CPU HotAdd" = $infovms.Config.CpuHotAddEnabled
        $info."Memory HotAdd" = $infovms.Config.MemoryHotAddEnabled
        $info."VMware Tools" = $infovms.Summary.Guest.ToolsRunningStatus
        $report += $info
}
$report | export-csv -Path "C:\Users\daniel.carvalhal\Documents\scripts-output\vms-informations.csv"