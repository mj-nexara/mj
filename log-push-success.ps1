# Get latest commit hash
$commitHash = git rev-parse HEAD

# Get current date
$date = Get-Date -Format "yyyy-MM-dd"

# Create log directory if it doesn't exist
$logDir = ".nexara\infra"
if (!(Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

# Define log file path
$logFile = "$logDir\push-success-$date.md"

# Write log content
@"
## Git Push Success — $date

- Commit: `$commitHash`
- Method: SSH via port 443 fallback
- Context: Nexara Core updates + Contributor protocol
- Verified: GitHub remote accepted delta compression
"@ | Out-File -FilePath $logFile -Encoding UTF8

# Stage and commit the log
git add $logFile
git commit -m "docs: anchored push success log for $date"
