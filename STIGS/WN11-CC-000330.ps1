<#
.SYNOPSIS
    Remediates DISA STIG WN11-CC-000330.

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-11
    Last Modified   : 2026-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000330
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000330/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000330.ps1 
#>

# Disable Basic Authentication for WinRM Client
# Requires: Run as Administrator
# Registry: HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client
# Value: AllowBasic = 0 (REG_DWORD)

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$valueName    = "AllowBasic"
$valueData    = 0
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
if ($written.$valueName -eq 0) {
    Write-Host "SUCCESS: $valueName set to $($written.$valueName) -- Basic authentication is disabled for WinRM Client." -ForegroundColor Green
} else {
    Write-Error "FAILED: Value was not set correctly."
    exit 1
}
