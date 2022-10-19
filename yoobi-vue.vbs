Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run "npm run serve --prefix C:/dev/www/yoobi/yoobi-vue/", 0
Set WinScriptHost = Nothing