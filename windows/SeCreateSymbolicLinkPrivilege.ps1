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

$currentUser = $Env:UserName
secedit /export /cfg .\\secpol.cfg
$Content = (Get-Content .\\secpol.cfg)
$Line = ($Content -match 'SeCreateSymbolicLinkPrivilege = ')
if (!($Line -match $Env:UserName)) {
    Write-Host "当前用户：",$currentUser
	$Content.replace('SeCreateSymbolicLinkPrivilege = ', 'SeCreateSymbolicLinkPrivilege = '+$currentUser+',') | Out-File .\\secpol.cfg
	secedit /configure /db c:\\windows\\security\\local.sdb /cfg .\\secpol.cfg
} else {
    Write-Host "当前用户：",$currentUser, " 已经有权限"
}

Remove-Item -force .\\secpol.cfg -confirm:$false