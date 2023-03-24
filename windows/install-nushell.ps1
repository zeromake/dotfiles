param(
    $version,
    $output
)

if (!(Test-Path($output))) {
    [System.IO.Directory]::CreateDirectory($output) | Out-Null
}
if (!(Test-Path("temp"))) {
    [System.IO.Directory]::CreateDirectory("temp") | Out-Null
}

if (!(Test-Path("temp\nu.zip"))) {
    . "$($PSScriptRoot)\download.ps1"
    DownloadFile "https://github.com/nushell/nushell/releases/download/$($version)/nu-$($version)-x86_64-pc-windows-msvc.zip" "temp\nu.zip"
}
Expand-Archive -Force -Path "temp\nu.zip" -DestinationPath $output
