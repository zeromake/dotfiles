
if (!(Get-Command pwsh -errorAction SilentlyContinue)) {
	scoop install pwsh
}

if (!(Get-Command oh-my-posh -errorAction SilentlyContinue)) {
    scoop install oh-my-posh
}

if (!(Get-Module PSReadLine)) {
	Install-Module PSReadLine -AllowPrerelease -Force
}

if (!(Get-Module posh-git)) {
    Install-Module posh-git -AllowPrerelease -Force
}

if (!(Get-Command sudo -errorAction SilentlyContinue)) {
	scoop install sudo
}

if (!(Test-Path -Path "$SystemRoot\Fonts\Fira Code Regular Nerd Font Complete Mono Windows Compatible.ttf" -PathType Leaf)) {
	sudo scoop install -g FiraCode-NF-Mono
}

Copy-Item .\windows\Microsoft.PowerShell_profile.ps1 $PROFILE -Confirm
