# Wires up this repo on a fresh Windows machine. Safe to re-run.
# Usage: pwsh -ExecutionPolicy Bypass -File $HOME\.config\setup.ps1

$configHome = Split-Path -Parent $MyInvocation.MyCommand.Path

# Point XDG-aware tools (nvim, etc.) at this repo instead of AppData
[Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME', $configHome, 'User')
Write-Host "XDG_CONFIG_HOME = $configHome"

# $PROFILE can't be relocated, so make it a stub that loads the repo profile
$stub = '. "$HOME\.config\powershell\profile.ps1"'
New-Item -ItemType Directory -Force (Split-Path $PROFILE) | Out-Null
if ((Test-Path $PROFILE) -and (Get-Content $PROFILE -Raw).Trim() -ne $stub) {
    Copy-Item $PROFILE "$PROFILE.bak" -Force
    Write-Host "Backed up existing profile to $PROFILE.bak"
}
Set-Content $PROFILE $stub
Write-Host "Profile stub written to $PROFILE"

# An old AppData nvim config would be ignored now, but is easy to edit by mistake
$oldNvim = "$env:LOCALAPPDATA\nvim"
if (Test-Path $oldNvim) {
    Write-Warning "$oldNvim exists and is no longer used; consider removing it."
}

Write-Host "Done. Open a new terminal to pick up the changes."
