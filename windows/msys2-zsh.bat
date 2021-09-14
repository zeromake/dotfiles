@echo off
setlocal EnableDelayedExpansion

set "WD=%~dp0usr\bin\"
set "LOGINSHELL=zsh"

set SHELL_ARGS=%*
set MSYS=winsymlinks:nativestrict
set CHERE_INVOKING=1

"%WD%bash" --login -c "%LOGINSHELL%"  !SHELL_ARGS!
