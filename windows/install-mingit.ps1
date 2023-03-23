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

if (!(Test-Path("temp\MinGit.zip"))) {
    . "$($PSScriptRoot)\download.ps1"
    DownloadFile "https://github.com/git-for-windows/git/releases/download/v$($version).windows.1/MinGit-$($version)-busybox-64-bit.zip" "temp\MinGit.zip"
}
Expand-Archive -Force -Path "temp\MinGit.zip" -DestinationPath $output
&"$($PSScriptRoot)\busybox-create-symlink.ps1" "$output\mingw64\bin\"
