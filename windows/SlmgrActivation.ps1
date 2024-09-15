param (
	$url = "192.168.12.23"
)

$ErrorActionPreference = 'Stop'

function Check-IsElevated {
    $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $p = New-Object System.Security.Principal.WindowsPrincipal($id)
    if ($p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
        return $true
    }
    else { 
        return $false
    }
}

if ( -Not $(Check-IsElevated) ) {
    Write-Host "当前账户非管理员权限"
    exit
}

slmgr /skms $url
slmgr /ato
