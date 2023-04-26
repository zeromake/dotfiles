# 快速设置 git 用户名与邮箱，工作 git 邮箱与个人邮箱的切换

param(
	$dir = ".",
	$name = "zeromake",
	$mail = "a390720046@gmail.com"
)

if(Test-Path -Path "$dir/.git") {
	Write-Host("设置 $dir 账号: $name<$mail>")
	Set-Location $dir
	git config user.name $name
	git config user.mail $mail
	Set-Location -
} else {
	Get-ChildItem $dir | ForEach-Object -Process{
		if ($_ -is [System.IO.DirectoryInfo]) {
			if(Test-Path -Path "$dir/$($_.name)/.git") {
				Write-Host("设置 $dir 账号: $name<$mail>")
				Set-Location "$dir/$($_.name)"
				git config user.name $name
				git config user.mail $mail
				Set-Location -
			}
		}
	}
}
