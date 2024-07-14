# prettyFunctional terminals
*Goal:* make any terminal on any system feel nice and familiar

Install the Agave Nerd Font from https://www.nerdfonts.com/font-downloads. Set`Agave Nerd Font` font for the following applications:
- Visual Studio Code (terminal font: `terminal.integrated.fontFamily`)
- PowerShell (admin)
- Windows Terminal

## Linux

```bash
# WIP: should be just the same as darwin just swap the brew for apt
```

## MacOS

```bash
# install the files
> git clone https://github.com/largerock/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./scripts/bootstrap-darwin.sh

# post installation dependencies
> .~/.deps
```
postinst `.~/.deps`

## Windows
0. install powershell 7: `winget install Microsoft.PowerShell`
1. Open powershell as admin
2. Run: `Set-ExecutionPolicy RemoteSigned` to allow the scripts to run.
3. Run: 
```bash
# install the powershell profile and scripts
cd ~\ && git clone https://github.com/largerock/dotfiles.git && cd dotfiles && .\scripts\bootstrap-windows.ps1

# post install deps (will run deps.ps1 inside of the $profile dir)
& (Join-Path (Split-Path -Parent $PROFILE) "deps.ps1")

# Post install to set SSH to use Powershell instead of CMD (requires PWSH 7 installed in deps)
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" `
∙                  -Name DefaultShell `
∙                  -Value "C:\Program Files\PowerShell\7\pwsh.exe" `
∙                  -PropertyType String `
∙                  -Force
```

adding windows keys:
C:/ProgramData/ssh/