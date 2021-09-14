@echo off
setlocal EnableDelayedExpansion

set "WD=%~dp0bin\"
set "LOGINSHELL=zsh"

set SHELL_ARGS=%*
set CHERE_INVOKING=1

"%WD%bash" --login -c "%LOGINSHELL%"  !SHELL_ARGS!
