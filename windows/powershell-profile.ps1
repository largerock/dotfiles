Import-Module -Name Terminal-Icons

# invoke all other .ps1 files in the profile directory
$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "components"

Get-ChildItem -Path $componentDir -Filter *.ps1 | ForEach-Object { . $_.FullName }
# add the functions and exports file
. "$profileDir\functions.ps1"
. "$profileDir\exports.ps1"
. "$profileDir\aliases.ps1"
# dont do the deps that just needs to be done once when installed

# Set up Starship prompt
Invoke-Expression (&starship init powershell)