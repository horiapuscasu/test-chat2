Dim oShell
Set oShell = WScript.CreateObject("WScript.Shell")
'oShell.Run "taskkill /f /im node.exe", , True
'oShell.Run "cmd.exe /k ""wmic process where name='node.exe' delete"" && exit", , True
oShell.Run "npx kill-port 8081", , True
set oShellEnv = oShell.Environment("Process")
computerName  = oShellEnv("AppData")
oShell.CurrentDirectory = computerName & "\npm\"
oShell.Run("""node"" --expose-gc signaling-server.js"), 0
Set oShell = Nothing