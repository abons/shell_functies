Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run "maildev", 0
Set WinScriptHost = Nothing
Dim iUrl
iURL = "http://localhost:1080"
set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "chrome.exe", iURL, "", "", 1