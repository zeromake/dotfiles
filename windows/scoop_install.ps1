param(
    $installDir = "D:\Scoop"
)

if (!(Get-Command scoop -errorAction SilentlyContinue)) {
    irm get.scoop.sh -outfile 'install.ps1'
    .\install.ps1 -ScoopDir $installDir -ScoopGlobalDir "$installDir\GlobalApps"
    Remove-Item .\install.ps1
}
