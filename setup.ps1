# MJ Hardware Check
Get-CimInstance -ClassName Win32_Battery
Get-WmiObject Win32_Processor | Select-Object Name, MaxClockSpeed

# OS Optimization
Start-Process "ms-settings:recovery"
Get-StoragePool
Get-WindowsFeature | Where-Object {$_.InstallState -eq "Installed"}

# Driver Fix (requires external tool)
Start-Process "Snappy Driver Installer.exe"

# Clean Bloatware
Get-AppxPackage | Remove-AppxPackage

# MJ Project Structure
New-Item -ItemType Directory -Path "$HOME\MJ-NEXARA"
New-Item -ItemType File -Path "$HOME\MJ-NEXARA\.env"
New-Item -ItemType File -Path "$HOME\MJ-NEXARA\bootstrap.sh"
New-Item -ItemType File -Path "$HOME\MJ-NEXARA\deploy.yml"

# Tool Setup
winget install Git.Git
winget install Microsoft.VisualStudioCode
winget install Python.Python.3.12
winget install OpenJS.NodeJS.LTS

# DNS & Git Setup
ipconfig /flushdns
git config --global user.name "MJ Ahmad"
git config --global user.email "mj@example.com"
