param(
    $version = "2.42.0",
    $sub_version = "2",
    $output
)

if (!(Test-Path($output))) {
    [System.IO.Directory]::CreateDirectory($output) | Out-Null
}
if (!(Test-Path("temp"))) {
    [System.IO.Directory]::CreateDirectory("temp") | Out-Null
}

if (!(Test-Path("temp\MinGit-${version}.zip"))) {
    . "$($PSScriptRoot)\download.ps1"
    DownloadFile "https://github.com/git-for-windows/git/releases/download/v${version}.windows.${sub_version}/MinGit-${version}.${sub_version}-busybox-64-bit.zip" "temp\MinGit-${version}.zip"
}
Expand-Archive -Force -Path "temp\MinGit-${version}.zip" -DestinationPath $output
&"$($PSScriptRoot)\busybox-create-symlink.ps1" "$output\mingw64\bin\"
