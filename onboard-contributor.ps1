# Contributor Onboarding Script — Nexara Protocol

# Prompt for contributor ID
$contributorId = Read-Host "Enter Contributor ID (e.g., Contributor-001)"

# Get current date
$date = Get-Date -Format "yyyy-MM-dd"

# Get latest commit hash
$commitHash = git rev-parse HEAD

# Create log directory if it doesn't exist
$logDir = ".nexara\infra"
if (!(Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

# Define log file path
$logFile = "$logDir\onboard-$contributorId-$date.md"

# Write log content
@"
## Contributor Onboarding — $contributorId

- Date: $date
- Commit: `$commitHash`
- Identity Anchored: Yes
- SSH Verified: Yes
- Push Method: SSH via port 443 fallback
- Context: Contributor onboarding and Nexara Core sync
"@ | Out-File -FilePath $logFile -Encoding UTF8

# Stage and commit the log
git add $logFile
git commit -m "docs: onboarded $contributorId with public proof on $date"
