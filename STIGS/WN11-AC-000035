<#
.SYNOPSIS
    This script configures the local minimum password length policy to require at least 14 characters with DISA STIG WN11-AC-000035.

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-11
    Last Modified   : 2026-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000035
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000035/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000035.ps1 
#>

# Set Minimum Password Length to 14 characters
# Requires: Run as Administrator
# Applies to: Local Security Policy (Computer Configuration)

$minPasswordLength = 14

# Using net accounts (built-in, no extra modules needed)
net accounts /minpwlen:$minPasswordLength

# Verify the setting was applied
Write-Host "`nVerifying configuration..." -ForegroundColor Cyan
net accounts | Select-String -Pattern "Minimum password length"
