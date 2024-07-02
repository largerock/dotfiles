Write-Output "Installing deps"
if (!(Verify-Elevated)) {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
 
    exit
}

# https://docs.microsoft.com/en-us/powershell/module/netsecurity/new-netfirewallrule?view=windowsserver2019-ps

New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Allow
New-NetFirewallRule -DisplayName "Allow ICMPv6-In" -Protocol ICMPv6 -IcmpType 8 -Direction Inbound -Action Allow

# enable ssh server and client
# https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse

dism /online /Add-Capability /CapabilityName:OpenSSH.Server~~~~
dism /online /Add-Capability /CapabilityName:OpenSSH.Client~~~~

# start ssh server
net start sshd
# set ssh server to start automatically
sc config sshd start=auto

# allow ssh through windows firewall
New-NetFirewallRule -DisplayName "OpenSSH Server" -Direction Inbound -Protocol TCP -LocalPort 22 -Action Allow

# install chocolatey
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# update winget
winget source update
winget install Git.Git                                  --silent --accept-package-agreements --accept-source-agreements --override "/VerySilent /NoRestart /o:PathOption=CmdTools /Components=""icons,assoc,assoc_sh,gitlfs"""
winget install Microsoft.PowerToys                      --silent --accept-package-agreements --accept-source-agreements
winget install Microsoft.WindowsTerminal                --silent --accept-package-agreements --accept-source-agreements
winget install Microsoft.VisualStudioCode
winget install Starship.Starship                        --silent --accept-package-agreements --accept-source-agreements
winget install OpenJS.NodeJS                            --silent --accept-package-agreements --accept-source-agreements
winget install Microsoft.AzureCLI                       --silent --accept-package-agreements --accept-source-agreements
winget install GNU.Nano                                 --silent --accept-package-agreements --accept-source-agreements


Refresh-Environment

Write-Output "deps installed"
