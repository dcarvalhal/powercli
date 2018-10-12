$report = @()
$cluster = get-cluster

Foreach ( $cls in $cluster) {
    $infoclsuter = Get-Cluster $cls | Get-View
    $info = {} | Select-Object Name, HA, VmMonitoring, HostMonitoring, AdmissionControl, CpuPolicy , MemoryPolicy, DRS, VMotionRate, DRSConfig, TotalCpuCapacityMhz, TotalMemCapacityMB, CpuReservationMhz, MemReservationMB, CpuDemandMhz, MemDemandMB, OverallStatus, ConfigStatus
        $info.Name = $infoclsuter.Name
        $info.HA = $infoclsuter.Configuration.DasConfig.Enabled
        $info.VmMonitoring = $infoclsuter.Configuration.DasConfig.VmMonitoring
        $info.HostMonitoring = $infoclsuter.Configuration.DasConfig.HostMonitoring
        $info.AdmissionControl = $infoclsuter.Configuration.DasConfig.AdmissionControlEnabled
        $info.CpuPolicy = $infoclsuter.Configuration.DasConfig.AdmissionControlPolicy.CpuFailoverResourcesPercent
        $info.MemoryPolicy = $infoclsuter.Configuration.DasConfig.AdmissionControlPolicy.MemoryFailoverResourcesPercent
        $info.DRS = $infoclsuter.Configuration.DrsConfig.Enabled
        $info.VMotionRate = $infoclsuter.Configuration.DrsConfig.VmotionRate
        $info.DrsConfig =  $infoclsuter.Configuration.DrsConfig.DefaultVmBehavior
        $info.TotalCpuCapacityMhz = $infoclsuter.Summary.UsageSummary.TotalCpuCapacityMhz
        $info.TotalMemCapacityMB = $infoclsuter.Summary.UsageSummary.TotalMemCapacityMB
        $info.CpuReservationMhz = $infoclsuter.Summary.UsageSummary.CpuReservationMhz
        $info.MemReservationMB = $infoclsuter.Summary.UsageSummary.MemReservationMB
        $info.CpuDemandMhz = $infoclsuter.Summary.UsageSummary.CpuDemandMhz
        $info.MemDemandMB = $infoclsuter.Summary.UsageSummary.MemDemandMB
        $info.OverallStatus = $infoclsuter.OverallStatus
        $info.ConfigStatus = $infoclsuter.ConfigStatus
        $report += $info
}
$report
$report | export-csv -Path "C:\Users\daniel.carvalhal\Documents\scripts-output\cluster-informations.csv"