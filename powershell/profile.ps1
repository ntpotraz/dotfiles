function Get-LinuxLikeList {
    Get-ChildItem -Force | Sort-Object @{Expression={$_.PsIsContainer}; Descending=$true}, Name
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name oc -Value opencode
Set-Alias -Name ls -Value Get-LinuxLikeList
