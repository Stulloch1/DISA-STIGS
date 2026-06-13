<#
.SYNOPSIS
    DISA STIG WN11-CC-000270.

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-11
    Last Modified   : 2026-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000270
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000270/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000270.ps1 
#>

# WN11-CC-000270 - Passwords must not be saved in the Remote Desktop Client
# Requires: Run as Administrator
# Registry: HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services
# Value: DisablePasswordSaving = 1 (REG_DWORD)

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$valueName    = "DisablePasswordSaving"
$valueData    = 1
$valueType    = "DWord"

# Create key path if it doesn't exist
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "Created registry key: $registryPath" -ForegroundColor Cyan
}

# Write the value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type $valueType

# Verify
$written = Get-ItemProperty -Path $registryPath -Name $valueName
if ($written.$valueName -eq 1) {
    Write-Host "SUCCESS: $valueName set to $($written.$valueName) -- passwords cannot be saved in RDP client." -ForegroundColor Green
} else {
    Write-Error "FAILED: Value was not set correctly."
    exit 1
}
