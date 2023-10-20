param(
    $dir = "."
)


. "$($PSScriptRoot)\download.ps1"

if (Test-Path("$dir\busybox.exe")) {
    Move-Item "$dir\busybox.exe" "$dir\busybox.exe.bak"
}

if (Test-Path("$dir\less.exe")) {
    Move-Item "$dir\less.exe" "$dir\less.exe.bak"
}

# 改用 busybox-w32 自行编译版，开启 utf8 支持，和 nu shell 配合使用
DownloadFile 'https://github.com/zeromake/dotfiles/releases/download/v0.1.0/busybox.exe' "$dir\busybox.exe"
# 使用支持高亮的 less-windows
DownloadFile 'https://github.com/zeromake/dotfiles/releases/download/v0.1.0/less.exe' "$dir\less.exe"
# DownloadFile 'https://github.com/jftuga/less-Windows/releases/download/less-v608/less.exe' "$dir\less.exe"