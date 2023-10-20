param(
    $version = "0.86.0",
    $output = "D:\Scoop\Program\nu"
)

if (!(Test-Path($output))) {
    [System.IO.Directory]::CreateDirectory($output) | Out-Null
}
if (!(Test-Path("temp"))) {
    [System.IO.Directory]::CreateDirectory("temp") | Out-Null
}

if (!(Test-Path("temp\nu-${version}.zip"))) {
    . "$($PSScriptRoot)\download.ps1"
    DownloadFile "https://github.com/nushell/nushell/releases/download/${version}/nu-${version}-x86_64-pc-windows-msvc.zip" "temp\nu-${version}.zip"
}
Expand-Archive -Force -Path "temp\nu-${version}.zip" -DestinationPath $output
