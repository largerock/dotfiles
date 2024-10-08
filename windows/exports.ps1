# Make nano the default editor
Set-Environment "EDITOR" "nano"
Set-Environment "GIT_EDITOR" $Env:EDITOR
Set-Environment "SSH_GIT" "C:\Windows\System32\OpenSSH\ssh.exe"

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")