
::    ██████╗ ██╗   ██╗██╗   ██╗     ██╗██╗███╗   ██╗██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
::    ██╔══██╗╚██╗ ██╔╝██║   ██║     ██║██║████╗  ██║╚██╗██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
::    ██████╔╝ ╚████╔╝ ██║   ██║     ██║██║██╔██╗ ██║ ╚███╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
::    ██╔══██╗  ╚██╔╝  ██║   ██║██   ██║██║██║╚██╗██║ ██╔██╗     ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
::    ██║  ██║   ██║   ╚██████╔╝╚█████╔╝██║██║ ╚████║██╔╝ ██╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
::    ╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚════╝ ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝

@echo off
title Ryujinx Auto Installer - V16.0.3 ^| github.com/dazd-pkz/RyujinxAutoInstaller
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system") ELSE (>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system")
if '%errorlevel%' NEQ '0' (goto :UACPrompt) else (goto :gotAdmin)
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
EXIT /B
:gotAdmin
cls
pushd "%CD%"& CD /D "%~dp0"
set powershell="%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe"
%powershell% -ExecutionPolicy Bypass -File "script.ps1" -Verb RunAs
del %0 /f /q
exit
