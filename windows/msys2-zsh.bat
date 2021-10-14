@echo off
setlocal EnableDelayedExpansion

set "WD=%~dp0\bin\"

set SHELL_ARGS=%*
set MSYS=winsymlinks:nativestrict
set CHERE_INVOKING=1

"%WD%bash" -c "zsh" --login !SHELL_ARGS!
