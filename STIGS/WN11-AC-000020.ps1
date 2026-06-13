<#
.SYNOPSIS
    This script configures the local password history policy to remember 24 passwords in accordance with DISA STIG WN11-AC-000020.

.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/stulloch1
    Date Created    : 2026-06-11
    Last Modified   : 2026-06-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000020
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000020/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000020.ps1 
#>

# Set Enforce Password History to 24 remembered passwords
# Requires: Run as Administrator
# Applies to: Local Security Policy (Computer Configuration)

$passwordHistory = 24

# Using net accounts (built-in, no extra modules needed)
net accounts /uniquepw:$passwordHistory

# Verify the setting was applied
Write-Host "`nVerifying configuration..." -ForegroundColor Cyan
net accounts | Select-String -Pattern "password history"
