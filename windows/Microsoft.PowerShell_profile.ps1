# 使用 tab 补全
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# 自动匹配上下键
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Import-Module posh-git

chcp 65001

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\the-unnamed.omp.json" | Invoke-Expression

$aliaArr = "ps", "ls", "rm", "where", "pwd", "cat", "wget", "curl"
for($i=0; $i -lt $aliaArr.Length; $i++) {
	$aliaName = $aliaArr[$i]
	if (test-path alias:$aliaName) {
		del alias:$aliaName -Force
	}
}

$funcArr = "mkdir", "ls"
for($i=0; $i -lt $funcArr.Length; $i++) {
	$name = $funcArr[$i]
	if (test-path function:$name) {
		del Function:$name -Force
	}
}
