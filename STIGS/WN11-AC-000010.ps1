<#
.SYNOPSIS
    Remediates DISA STIG WN11-AC-000010.


.NOTES
    Author          : Shemar Tulloch
    LinkedIn        : linkedin.com/in/shemartulloch/
    GitHub          : github.com/Stulloch1
    Date Created    : 2026-06-11
    Last Modified   : 2026-06-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AC-000010/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AC-000010.ps1 
#>

# Full recommended lockout policy configuration
net accounts /lockoutthreshold:3    # Lock after 3 bad attempts
net accounts /lockoutduration:15    # Lock for 15 minutes (0 = until admin unlocks)
net accounts /lockoutwindow:15      # Reset bad-attempt counter after 15 minutes

# Confirm all lockout settings
Write-Host "`nCurrent Account Lockout Policy:" -ForegroundColor Green
net accounts | Select-String -Pattern "Lockout"
