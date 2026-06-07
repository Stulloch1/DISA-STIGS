<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-07
    Last Modified   : 2024-06-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'

# Create the registry key if it doesn't exist
New-Item -Path $Path -Force | Out-Null

# Set MaxSize = 0x00008000 (32768 decimal)
New-ItemProperty `
    -Path $Path `
    -Name 'MaxSize' `
    -PropertyType DWord `
    -Value 0x00008000 `
    -Force | Out-Null
