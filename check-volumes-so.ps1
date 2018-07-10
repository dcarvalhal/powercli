# Lista de Máquinas
$vms = @( 
    "DC1B4GIMDBP02.buy4sc.local",
    "DC1B4DB05P01.buy4sc.local",
    "DC1B4DB03P01.buy4sc.local",
    "DC1B4TESOUDBP01.buy4sc.local"
    	 );

# Credencial para Remote session

#$cred = Get-Credential 

# Looping de execução do comando

Foreach ($vm in $vms){            
        
   # Executa o comando no computador remoto através da sessão
   Invoke-Command -ComputerName $vm -Scriptblock {get-disk | where {($_.FriendlyName -like "*EQLOGIC*") -and ($_.OperationalStatus -like "*Offline")}}
       
}