$report = @()
$vms = get-vm

 Foreach ($vm in $vms) {
    $infovms = $vm | Get-View
    $info = {} | Select-Object Name, CpuHotAdd, MemHotAdd, CpuReservation, MemReservation
    $info.Name = $infovms.Name
    $info.CpuHotAdd = $infovms.Config.CpuHotAddEnabled  
    $info.MemHotAdd = $infovms.Config.MemoryHotAddEnabled
    $info.CpuReservation = $infovms.Config.CpuAllocation.Reservation
    $info.MemReservation = $infovms.Config.MemoryAllocation.Reservation
    $report += $info
}
$report | export-csv -Path "C:\Users\daniel.carvalhal\Documents\scripts-output\vms-hotadd-reservation.csv"
$report