# Fresh Windows Install Script

# Note: You must have your execution policy set to unrestricted (or at least in bypass) for either
# approach to work. To set this, run Set-ExecutionPolicy Unrestricted from a PowerShell running as 
# Administrator.

# Git-free install
# To install these dotfiles from PowerShell without Git:
## iex ((new-object net.webclient).DownloadString('https://raw.github.com/jayharris/dotfiles-windows/master/setup/install.ps1'))

# Using Git and the bootstrap script
# Feel free to clone this wherever; the bootstrap script will copy the files to your 
# PowerShell Profile folder:
## git clone https://github.com/jayharris/dotfiles-windows.git
## cd dotfiles-windows
## . .\bootstrap.ps1

# To update your settings from this directory, navigate to this file and then run:
## . .\bootstrap.ps1

# To update later on, just run that command again.
# Lots of thanks & credit to https://github.com/jayharris/dotfiles-windows
################################################################################


$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "components"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "bootstrap.ps1"
Copy-Item -Path ./components/** -Destination $componentDir -Include **
Copy-Item -Path ./home/** -Destination $home -Include **

Remove-Variable componentDir
Remove-Variable profileDir
