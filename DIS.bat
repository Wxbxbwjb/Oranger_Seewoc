:a
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
sc stop SWZoroHttps
goto find

:find
tasklist | find "SeewoCore.exe" >nul && goto a
timeout /t 2 >nul
goto find

