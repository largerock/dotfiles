Write-Output "Bootstrapping Windows"
$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "components"

#  Create the profile dir 
New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

#  Copy starship config and windows scripts to the user profile
Copy-Item -Path ".\starship\.config\starship.toml" -Destination "$env:USERPROFILE\.config" -Force
Copy-Item -Path ".\windows\*.ps1" -Destination $profileDir -Force
Copy-Item -Path ".\windows\components\*.ps1" -Destination $componentDir -Force


Remove-Variable profileDir
