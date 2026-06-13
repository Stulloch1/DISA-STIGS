<#
.SYNOPSIS
    Remediates DISA STIG WN11-CC-000360.

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-11
    Last Modified   : 2026-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000360
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000360/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000360.ps1 
#>

$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client'
$ValueName = 'AllowDigest'
$ValueData = 0

# Create the registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Host "Configured $ValueName = $ValueData at $RegistryPath"
