# MJ-NEXARA Setup.ps1
Write-Host "🔧 MJ Setup Started..."

# Create project folders
$folders = @("MJ-NEXARA", "mj-docs", "nexara-utils")
foreach ($f in $folders) { New-Item -ItemType Directory -Path "$HOME\$f" }

# Install essential tools
$apps = @("Git.Git", "Microsoft.VisualStudioCode", "Python.Python.3.12", "OpenJS.NodeJS.LTS")
foreach ($app in $apps) { winget install $app }

# Create config files
New-Item -ItemType File -Path "$HOME\MJ-NEXARA\.env"
New-Item -ItemType File -Path "$HOME\MJ-NEXARA\bootstrap.sh"
New-Item -ItemType File -Path "$HOME\MJ-NEXARA\deploy.yml"

# DNS & Git Config
ipconfig /flushdns
git config --global user.name "MJ Ahmad"
git config --global user.email "mj@example.com"

Write-Host "✅ MJ Setup Complete!"
