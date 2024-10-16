# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

if (-not (Get-Module -ListAvailable -Name posh-git)) {
    Install-Module -Name posh-git -RequiredVersion 1.0.0
}
Import-Module posh-git

if (-not (Get-Module -ListAvailable -Name PSFzf)) {
    Install-Module -Name PSFzf
}
Import-Module PSFzf

if (-not (Get-Module -ListAvailable -Name PSModuleDevelopment)) {
    Install-Module -Name PSModuleDevelopment
}
Import-Module -Name PSModuleDevelopment

if (-not (Get-Module -ListAvailable -Name PSReadLine)) {
    Install-Module -Name PSReadLine
}
Import-Module -Name PSReadLine

if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
}
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Enhanced PowerShell Experience
Set-PSReadLineOption -Colors @{
    Command = 'Yellow'
    Parameter = 'Green'
    String = 'DarkCyan'
}

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Update Checker #
function checkUpdate {
    # Initial GitHub.com connectivity check with 1 second timeout
    $canConnectToGitHub = Test-Connection "https://www.github.com" -Count 1 -Quiet -TimeoutSeconds 1
    if (-not $global:canConnectToGitHub) {
        Write-Host "Skipping update check due to GitHub.com not responding." -ForegroundColor Yellow
        return
    }
    # Check Powershell Update and Do if available
    try {
        $updateNeeded = $false
        $currentVersion = $PSVersionTable.PSVersion.ToString()
        $gitHubApiUrl = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
        $latestReleaseInfo = Invoke-RestMethod -Uri $gitHubApiUrl
        $latestVersion = $latestReleaseInfo.tag_name.Trim('v')
        $pwshUpdateNotes = $latestReleaseInfo.body
        if ($currentVersion -lt $latestVersion) {
            $updateNeeded = $true
            Write-Host "Powershell latest version: " $latestVersion " available. Run 'UpdatePwsh'" -ForegroundColor Yellow
            Write-Host $pwshUpdateNotes
        } else {
            Write-Host "Your PowerShell is up to date." -ForegroundColor Green
        }
    }
    catch {
        Write-Error "Failed to update PowerShell. Error: $_"
    }
}

# Function to check the last run date
function Get-LastRunDate {
    $lastRunFile = "$HOME\.checkUpdate.txt"
    if (Test-Path $lastRunFile) {
        return Get-Content $lastRunFile
    } else {
        return $null
    }
}

# Function to update the last run date
function Set-LastRunDate {
    $lastRunFile = "$HOME\.checkUpdate.txt"
    Get-Date -Format "yyyy-MM-dd" | Out-File $lastRunFile
}

# Main logic to check and run the function once daily
$lastRunDate = Get-LastRunDate
$currentDate = Get-Date -Format "yyyy-MM-dd"

if ($lastRunDate -ne $currentDate) {
    checkUpdate
    Set-LastRunDate
} else {
    Write-Host "Everything is up to date." -ForegroundColor Green
}

function UpdatePwsh{
    winget upgrade "Microsoft.PowerShell" --accept-source-agreements --accept-package-agreements
    Write-Host "PowerShell has been updated. Please restart your shell to reflect changes" -ForegroundColor Green
}

# Admin Check and Prompt Customization
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
function prompt {
    if ($isAdmin) { "[" + (Get-Location) + "] # " } else { "[" + (Get-Location) + "] $ " }
}
$adminSuffix = if ($isAdmin) { "[ADMIN]" } else { "" }
$Host.UI.RawUI.WindowTitle = "PowerShell {0}$adminSuffix" -f $PSVersionTable.PSVersion.ToString()

#----------------------- [ UTILITY FUNCTIONS ] -----------------------#
function prompt {
    if ($isAdmin) {
        "[" + (Get-Location) + "] # "
    } else {
        "[" + (Get-Location) + "] $ "
    }
} #outputs nothing, maybe bcz missing UNIX CMD

$Host.UI.RawUI.WindowTitle = "PowerShell {0}" -f $PSVersionTable.PSVersion.ToString()
if ($isAdmin) {
    $Host.UI.RawUI.WindowTitle += "[ADMIN]"
}

# Find out if the current user identity is elevated (has admin rights)
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal $identity
$isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# System Utilities
function admin {
    if ($args.Count -gt 0) {
        $argList = "& '$args'"
        Start-Process wt -Verb runAs -ArgumentList "pwsh.exe -NoExit -Command $argList"
    } else {
        Start-Process wt -Verb runAs
    }
} #works but ugly

# Compute file hashes - useful for checking successful downloads
function md5 { Get-FileHash -Algorithm MD5 $args }
function sha1 { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }

# Networking Utilities
function flushdns { Clear-DnsClientCache }

#Get Your Public-IP
function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }

# Open WinUtil
function winutil {
	iwr -useb https://christitus.com/win | iex
}

# System Utilities
function awake {
    if ($PSVersionTable.PSVersion.Major -eq 5) {
        Get-WmiObject win32_operatingsystem | Select-Object @{Name='LastBootUpTime'; Expression={$_.ConverttoDateTime($_.lastbootuptime)}} | Format-Table -HideTableHeaders
    } else {
        net statistics workstation | Select-String "since" | ForEach-Object { $_.ToString().Replace('Statistics since ', '') }
    }
}

function uptime {
    if ($PSVersionTable.PSVersion.Major -eq 5) {
        Get-WmiObject win32_operatingsystem | Select-Object @{Name='LastBootUpTime'; Expression={$_.ConverttoDateTime($_.lastbootuptime)}} | Format-Table -HideTableHeaders
    } else {
        net statistics workstation | Select-String "since" | ForEach-Object { $_.ToString().Replace('Statistics since ', '') }
    }
}
# We don't need these any more; they were just temporary variables to get to $isAdmin.
# Delete them to prevent cluttering up the user profile.
Remove-Variable identity
Remove-Variable principal

function Test-CommandExists {
    param($command)
    $exists = $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
    return $exists
}

# Editor Configuration
$EDITOR = if (Test-CommandExists nvim) { 'nvim' }
          elseif (Test-CommandExists vim) { 'vim' }
          elseif (Test-CommandExists vi) { 'vi' }
          elseif (Test-CommandExists code) { 'code' }
          elseif (Test-CommandExists notepad++) { 'npp' }
          elseif (Test-CommandExists sublime_text) { 'sublime' }
          else { 'notepad' }

# Make it easy to edit this profile once it's installed
function Edit-Profile {
    vim $PROFILE.CurrentUserAllHosts
}

# Enhanced Listing
function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

# Git Shortcuts
function gs { git status }
function ga { git add . }
function ga { param($f) git add $f }
function gc { param($m) git commit -m "$m" }
function gp { git push }
function g { z Github }
function gcl { git clone https://github.com/"$args" }
function gcom {
    git add .
    git commit -m "$args"
}

function lazyg {
    git add .
    git commit -m "$args"
    git push
}

function src.profile {
    & $profile
} #works

# Clipboard Utilities
function cpy { Set-Clipboard $args[0] }

function pst { Get-Clipboard }

function locate ($name) {
    Get-ChildItem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Output "$($_.FullName)`n->\$($_)"
    }
}
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

function ix ($file) {
    curl.exe -F "f:1=@$file" ix.io
}

function grep($regex, $dir) {
    if ( $dir ) {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

function touch($file) {
    "" | Out-File $file -Encoding ASCII
}

function df {
    get-volume
}

function sed($file, $find, $replace) {
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

function export($name, $value) {
    set-item -force -path "env:$name" -value $value;
}

function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

function pgrep($name) {
    Get-Process $name
}

# Quick File Creation
function nf { param($name) New-Item -ItemType "file" -Path . -Name $name }

# Directory Management
function mkcd { param($dir) mkdir $dir -Force; Set-Location $dir }

# Navigation Shortcuts
function .. { Set-Location ..\ }
function cd... { Set-Location ..\.. }
function cd.... { Set-Location ..\..\.. }
function docs { Set-Location -Path $HOME\Documents }
function dtop { Set-Location -Path $HOME\Desktop }
function down { Set-Location -Path $HOME\Downloads }
function local { Set-Location -Path $HOME\AppData\Local }
function g { Set-Location $HOME\Documents\Github }

# Quick Access to Editing the Profile
function ep { nvim $PROFILE }

# Simplified Process Management
function k9 { Stop-Process -Name $args[0] }

#----------------------- [ Aliases ] -----------------------#
Set-Alias -Name vim -Value nvim
Set-Alias -Name gvim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias npp 'C:\Program Files\Notepad++\notepad++.exe'
Set-Alias -Name su -Value admin
Set-Alias -Name sudo -Value admin
Set-Alias -Name vim -Value $EDITOR

#--------------------------------------

# Define the Select-NvimConfig function
function nvims {
    $items = @("Default", "Kickstart", "NormalNvim", "NvChad", "ChrisMachine")

    # Use fzf for selection with specified width
    $config = $items | fzf --prompt=" Neovim Config 󱞤 " --height=50% --layout=reverse --border --exit-0

    if ([string]::IsNullOrEmpty($config)) {
        Write-Host "Nothing selected"
        return
    }

    if ($config -eq "default") {
        $config = ""
    }

    $env:NVIM_APPNAME = $config
    nvim
}

#----------------------- [ oh-my-posh ] -----------------------#
# Invoke Starship Prompt
function ship{
    Invoke-Expression (&starship init powershell)
    Enable-TransientPrompt
}

# Get theme from profile.ps1 or use a default theme
function Get-Theme {
    if (Test-Path -Path $PROFILE.CurrentUserAllHosts -PathType leaf) {
        $existingTheme = Select-String -Raw -Path $PROFILE.CurrentUserAllHosts -Pattern "oh-my-posh init powershell --config"
        if ($null -ne $existingTheme) {
            Invoke-Expression $existingTheme
            return
        }
    } else {
        oh-my-posh init powershell --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/tokyonight_storm.omp.json | Invoke-Expression
    }
}

function ompEdit{
    code "$env:POSH_THEMES_PATH\another_mahir.omp.toml"
}
function shipEdit{
    code "$HOME\.config\starship.toml"
}

# [Default] POSH_THEMES_PATH = "C:\Users\Mahir\AppData\Local\Programs\oh-my-posh\themes"
# [current] POSH_THEMES_PATH = "C:\Users\Mahir\Documents\OMP-Themes"

oh-my-posh init powershell --config "$env:POSH_THEMES_PATH\another_mahir.omp.toml" | Invoke-Expression
# starship init powershell | Invoke-Expression

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
} else {
    Write-Host "zoxide command not found. Attempting to install via winget..."
    try {
        winget install -e --id ajeetdsouza.zoxide
        Write-Host "zoxide installed successfully. Initializing..."
        Invoke-Expression (& { (zoxide init powershell | Out-String) })
    } catch {
        Write-Error "Failed to install zoxide. Error: $_"
    }
}
#------------------------------------------------------#
