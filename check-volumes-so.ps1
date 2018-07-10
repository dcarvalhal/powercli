# Lista de Máquinas
$vms = @( 
    "DC1B4GIMDBP02@buy4sc.local",
    "DC1B4DB05P01@buy4sc.local",
    "DC1B4DB03P01@buy4sc.local",
    "DC1B4TESOUDBP01@buy4sc.local"
    	 );

# Credencial para Remote session

   $cred = Get-Credential 


$script = get-disk | where {($_.FriendlyName -like "*EQLOGIC*") -and ($_.OperationalStatus -like "*Offline")}

# Looping de execução do script

Foreach ($vm in $vms){            
   
   #Cria uma nova sessão especificando o método de autenticação Credssp      
   $s = New-PSSession -computerName $vm -credential $cred -Authentication Credssp
     
   # Executa o comando no computador remoto através da sessão
   Invoke-Command -Session $s -Scriptblock $script  
   
   #Sai da sessão
   Remove-PSSession $s    
}