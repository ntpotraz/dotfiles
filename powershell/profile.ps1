function Get-LinuxLikeList {
    Get-ChildItem -Force | Sort-Object @{Expression={$_.PsIsContainer}; Descending=$true}, Name
}

# Alt+h/j/k/l moves between psmux panes (nvim handles the same keys itself)
if ($env:TMUX -and (Get-Module -ListAvailable PSReadLine)) {
    foreach ($key in @{ h = 'L'; j = 'D'; k = 'U'; l = 'R' }.GetEnumerator()) {
        $dir = $key.Value
        Set-PSReadLineKeyHandler -Chord "alt+$($key.Key)" -ScriptBlock ({ psmux select-pane "-$dir" }.GetNewClosure())
    }
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name oc -Value opencode
Set-Alias -Name ls -Value Get-LinuxLikeList
