$serviceName = "HwInfoWorker"

if (![bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) 
{
	Write-Host "Script requires admin privileges to run."
}
elseif (!(Get-Service $serviceName -ErrorAction SilentlyContinue))
{
	Write-Host "Service does not exist."
}
elseif ((Get-Service $serviceName).Status -eq "Stopped")
{
	Write-Host "Service is already stopped."
}
else 
{
	Write-Host "Stopping service ..."

	Stop-Service -Name $serviceName
}
Write-Host "Press any key to continue ..."
Start-Process PowerShell {[void][System.Console]::ReadKey($true)} -Wait -NoNewWindow