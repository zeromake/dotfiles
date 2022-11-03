if (!(Get-Command pwsh -errorAction SilentlyContinue)) {
	winget install --id Microsoft.Powershell --source winget
}

if (!(Get-Module PSReadLine)) {
	Install-Module PSReadLine -AllowPrerelease -Force
}
cp .\windows\Microsoft.PowerShell_profile.ps1 $PROFILE -Confirm
