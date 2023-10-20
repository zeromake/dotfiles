param(
    $action = "help",
    $dir = "D:\Scoop\Program"
)

$ErrorActionPreference = 'Stop'


if ($action -eq "init") {
    if (!(Test-Path($dir))) {
        [System.IO.Directory]::CreateDirectory($dir) | Out-Null
    }
    Write-Host "下载 mingit"
    &"$PSScriptRoot\windows\install_mingit.ps1" "2.42.0" "2" "$dir\mingit"
    Write-Host "下载 nushell"
    &"$PSScriptRoot\windows\install_nushell.ps1" "0.86.0" "$dir\nu"
    Write-Host "替换 busybox"
    &"$PSScriptRoot\windows\replace_busybox.ps1" "$dir\mingit\mingw64\bin"
}
