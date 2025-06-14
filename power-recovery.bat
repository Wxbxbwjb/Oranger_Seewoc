setx /M PATH "%PATH%;C:\Program Files (x86)\Seewo\"

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown" /v value /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Start\HidePowerButton" /v value /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HidePowerOptions /t REG_DWORD /d 0 /f