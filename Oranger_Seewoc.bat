::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyEA3FJm0hjjRcjuGA60Z1Mfp7uSAp18iZ+c6b4DYl5eiCa4W8kCE
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF65
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF65
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJFuDyMDQ4icHAlS+OXO/OpoO6eb86vi4kUgYQ+08NorD39Q=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

set "VERSION=1.0.1"

if "%~1"=="" exit /b 1


if /i "%~1"=="-version"    goto :version
if /i "%~1"=="-v"          goto :version

if /i "%~1"=="-h"          goto :help
if /i "%~1"=="-help"       goto :help
if /i "%~1"=="-?"          goto :help

if /i "%~1"=="-en"         goto :en
if /i "%~1"=="-dis"        goto :dis
if /i "%~1"=="-cil"        goto :cil
if /i "%~1"=="-kcil"       goto :kcil
if /i "%~1"=="-power"      goto :power
if /i "%~1"=="-us"         goto :us
if /i "%~1"=="-sf"         goto :sf

start cmd.exe /c "%b2eincfilepath%\Oranger_Seewoc-CLI.exe %~1"
echo Error: Unknown argument '%~1'
echo use '-h' for help.
exit /b 0

:version
echo Oranger_Seewoc CLI v%VERSION% 
start cmd.exe /c "%b2eincfilepath%\Oranger_Seewoc-CLI.exe -v"
exit /b 0

:help
echo Available commands: 
echo   -en       start seewo
echo   -dis      stop seewo
echo   -v        show version
echo   -cil      start classisland
echo   -kcil     stop classisland
echo   -power    set power
echo   -us       seewo-update-new-simplify
echo   -sf       seewo-freeze-startup-with-main-window
start cmd.exe /c "%b2eincfilepath%\Oranger_Seewoc-CLI.exe -h"
exit /b 0

:en
taskkill /f /T /im DIS.exe >nul 2>&1

sc start EasiUpdate3 >nul
sc start EasiUpdate3Protect >nul
sc start SeewoCore.cpu.temperature >nul
sc start SeewoCoreService >nul
sc start SeewoKeLiteLady >nul
sc start SeewoProxyLayerService >nul
sc start SeewoZoroWall >nul
sc start SWZoroHttps >nul
sc start Nami >nul
sc start EasiUpdate3 >nul
sc start EasiUpdate3Protect >nul
sc start SeewoCore.cpu.temperature >nul
sc start SeewoCoreService >nul
sc start SeewoKeLiteLady >nul
sc start SeewoProxyLayerService >nul
sc start SeewoZoroWall >nul
sc start SWZoroHttps >nul
sc start Nami >nul
taskkill /f /T /im Oranger_Seewoc.exe >nul 2>&1
exit /b 0

:cil
taskkill /f /im ClassIsland.exe >nul 2>&1
start "" "D:\cil.lnk"
exit /b 0

:kcil
taskkill /f /im ClassIsland.exe >nul 2>&1
exit /b 0

:power
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown" /v value /t REG_DWORD /d 0 /f >nul
exit /b 0

:us
set "targets[0]=C:\Program Files (x86)\Seewo"
set "targets[1]=C:\ProgramData\Seewo"
set "targets[2]=C:\Users\seewo\AppData\Local\Seewo"
set "targets[3]=C:\Users\seewo\AppData\Roaming\Seewo"

for /l %%i in (0,1,3) do (
    if exist "!targets[%%i]!\" (
        pushd "!targets[%%i]!"
        for /r %%f in (*update*.exe *upgrade*.exe) do (
            ren "%%f" "%%~nf.exe.dor0" 2>nul && (
                reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~nxf" /v Debugger /t REG_SZ /d "\"%%~dpnf.whoami\"" /f >nul
            )
        )
        popd
    )
)

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown" /v value /t REG_DWORD /d 1 /f >nul
exit /b 0

:sf
taskkill /f /im seewocore.exe >nul 2>&1
start "" "C:\UnFreeze\SeewoFreeze\SeewoFreezeUI.exe" --startup-with-main-window
exit /b 0

:dis
:dis_loop
taskkill /f /im SeewoCore.exe
taskkill /f /im EasiAgent.exe
taskkill /f /im SeewoAbility.exe
taskkill /f /im SeewoServiceAssistant.exe
taskkill /f /im media_capture.exe
taskkill /f /im crashpad_handler.exe
taskkill /f /im EasiUpdate3.exe
taskkill /f /im SeewoFreezeUpdateAssist.exe
taskkill /f /im rtcRemoteDesktop.exe
sc stop EasiUpdate3
sc stop EasiUpdate3Protect
sc stop SeewoCore.cpu.temperature
sc stop SeewoCoreService
sc stop SeewoFreezeAssist.cpu.temp
sc stop SeewoFreezeUpdateAssist
sc stop SeewoKeLiteLady
sc stop SeewoProxyLayerService
sc stop SeewoZoroWall
sc stop SWZoroHttps
sc stop Nami
sc stop SeewoKeLiteLady

:find
tasklist | find "SeewoCore.exe" >nul
if errorlevel 1 (
    timeout /t 2 >nul
    goto find
) else (
    goto dis_loop
)

