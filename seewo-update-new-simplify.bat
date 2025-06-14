@echo on
setlocal enabledelayedexpansion


NET FILE >NUL 2>&1 || (powershell -Command "Start-Process '%~0' -Verb RunAs" & exit /b)

set "target[0]=C:\Program Files (x86)\Seewo"
set "target[1]=C:\ProgramData\Seewo"
set "target[2]=C:\Users\seewo\AppData\Local\Seewo"
set "target[3]=C:\Users\seewo\AppData\Roaming\Seewo"
set "keywords=upgrade update"

for /l %%i in (0,1,3) do (
    set "current_target=!target[%%i]!"
    
    if exist "!current_target!\" (
        for %%k in (%keywords%) do (
            pushd "!current_target!"
            for /r %%f in (*%%k*.exe) do (
                if exist "%%f" (
                    echo 处理文件: %%~nxf
                    ren "%%f" "%%~nf.exe.dor0" 2>nul && (
                        set "exe_name=%%~nxf"
                        set "new_path=%%~dpf%%~nf.whoami"
                        
                        
                        set "new_path=!new_path:\=\\!"
                        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\!exe_name!" /v Debugger /t REG_SZ /d "\"!new_path!\"" /f  
                    )
                )
            )
            popd
        )
    ) else (
        echo 目录不存在: !current_target!
    )
)


reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown" /v value /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HidePowerButton" /v value /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HidePowerOptions /t REG_DWORD /d 1 /f

