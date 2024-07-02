Write-Output "doing exports"

# Make nano the default editor
Set-Environment "EDITOR" "nano"
Set-Environment "GIT_EDITOR" $Env:EDITOR