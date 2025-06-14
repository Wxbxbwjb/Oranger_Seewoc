setx /M PATH "%PATH%;C:\Program Files (x86)\Seewo\"

xcopy /E /C /H /K /I /Y D:\bg\UnFreeze C:\UnFreeze
attrib +s +h C:\UnFreeze

xcopy /C /H /K /I /Y C:\ProgramData\seewo\SeewoCore\SeewoCore.ini D:\bg\SeewoCore\
xcopy /E /C /H /K /I /Y C:\Windows\System32\config D:\bg\sys32-config

taskkill /f /im Autorun.exe
cd /d D:\bg\
start %cd%\Autorun.exe

taskkill /f /im media_capture.exe
taskkill /f /im crashpad_handler.exe
taskkill /f /im EasiUpdate3.exe
taskkill /f /im SeewoFreezeUpdateAssist.exe

sc delete EasiUpdate3
sc delete EasiUpdate3Protect
sc delete SeewoFreezeAssist.cpu.temp
sc delete SeewoFreezeUpdateAssist

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown" /v value /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HidePowerButton" /v value /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HidePowerOptions /t REG_DWORD /d 1 /f

::Freeze
setlocal enabledelayedexpansion
set "search_path=C:\ProgramData"
for /r "%search_path%" %%f in (*freeze*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Program Files (x86)\Seewo"
for /r "%search_path%" %%f in (*freeze*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Users\seewo\AppData\Local\Seewo"
for /r "%search_path%" %%f in (*freeze*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Users\seewo\AppData\Roaming"
for /r "%search_path%" %%f in (*freeze*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal







setlocal enabledelayedexpansion
set "search_path=C:\Program Files (x86)\Seewo"
for /r "%search_path%" %%f in (*upgrade*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\ProgramData\Seewo"
for /r "%search_path%" %%f in (*upgrade*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Users\seewo\AppData\Local\Seewo"
for /r "%search_path%" %%f in (*upgrade*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Users\seewo\AppData\Roaming\Seewo"
for /r "%search_path%" %%f in (*upgrade*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal








setlocal enabledelayedexpansion
set "search_path=C:\Program Files (x86)\Seewo"
for /r "%search_path%" %%f in (*update*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\ProgramData\Seewo"
for /r "%search_path%" %%f in (*update*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Users\seewo\AppData\Local\Seewo"
for /r "%search_path%" %%f in (*update*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal

setlocal enabledelayedexpansion
set "search_path=C:\Users\seewo\AppData\Roaming\Seewo"
for /r "%search_path%" %%f in (*update*.*) do (
    echo %%f
    set "filename=%%f"

    for %%i in ("!filename!") do (
        set "name=%%~ni"
        set "ext=%%~xi"

        ren "!filename!" "!name!!ext!a"
    )
)
endlocal















