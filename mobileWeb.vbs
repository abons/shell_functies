Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run "npm run web --prefix C:/dev/www/yoobiMobile", 0
Set WinScriptHost = Nothing