@echo off
cd /d "C:\Program Files (x86)\Seewo\EasiAgent"
setlocal enabledelayedexpansion

for /r %%i in (*) do (
    set "filename=%%~ni"
    set "extension=%%~xi"
    set "newextension=!extension:a=!"
    if not "!extension!"=="!newextension!" (
        ren "%%i" "!filename!!newextension!"
    )
)

endlocal


cd /d "C:\Program Files (x86)\Seewo\SeewoService"
setlocal enabledelayedexpansion
setlocal enabledelayedexpansion

for /r %%i in (*) do (
    set "filename=%%~ni"
    set "extension=%%~xi"
    set "newextension=!extension:a=!"
    if not "!extension!"=="!newextension!" (
        ren "%%i" "!filename!!newextension!"
    )
)

endlocal
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SeewoHugoLauncher.exe" /f

SET "regKeyPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
SET "taskName=antihugo"
SET "exePath=D:\bg\hugo.exe"

:: 删除注册表中的hugo键�?
reg delete "%regKeyPath%" /f /v "%taskName%" 2>nul

:: 检查任务是否存在并删除
for /f "tokens=2 delims=:" %%i in (' schtasks /query /TN "%taskName%" /fo LIST /v ') do (
    schtasks /delete /TN "%taskName%" /F 2>nul
    echo Task "%taskName%" has been deleted.
)

:: 从启动文件夹中移除具有系统和隐藏属性的hugo.lnk快捷方式
attrib -s -h "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\hugo.lnk"
del "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\hugo.lnk"
