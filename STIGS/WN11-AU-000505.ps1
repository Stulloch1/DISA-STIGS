<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-13
    Last Modified   : 2026-06-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000505
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000505/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000505.ps1 
#>

$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security'
$ValueName    = 'MaxSize'
$MinimumValue = 5120000

# Create the registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Read current value
$currentValue = (Get-ItemProperty -Path $RegistryPath -Name $ValueName -ErrorAction SilentlyContinue).$ValueName

# Set value if missing or less than required
if (($null -eq $currentValue) -or ($currentValue -lt $MinimumValue)) {
    New-ItemProperty `
        -Path $RegistryPath `
        -Name $ValueName `
        -PropertyType DWord `
        -Value $MinimumValue `
        -Force | Out-Null

    Write-Output "Set $ValueName to $MinimumValue."
}
else {
    Write-Output "$ValueName is already compliant ($currentValue)."
}
