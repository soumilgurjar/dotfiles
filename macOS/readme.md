# Soumil Gurjar's Dotfiles

## What Is This?

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything which is needed to install my preffered setup of OS X is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles.

## A Fresh OS X Setup

Follow these install instructions to setup a new Mac.

1. Update OS X to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install OS X Command Line Tools
4. Clone this repo to `~/.dotfiles` with 
```zsh
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://gitlab.math.ethz.ch/sgurjar/dotfiles.git .
```
5. Run `install.sh` to start the installation
6. Make sure Dropbox is set up and synced
7. Restore preferences by running `cd ~ && mackup restore`
8. Install apps listed below which could not be install with brew or mas
9. Restart your computer to finalize the process
Your Mac is now ready to use!

## Install applications 

## Install applications manually
The following applications could not be installed with the brewfile method. So we need to install them manually.
- Logitech G Hub, Logi Options, Logi Capture
- Matlab
- Mendeley
- GMSH, mmgs, meshlab, Paraview ?
- MS Office suite
- polybox


## Mackup restore
Mackup should already be installed from the Brewfile. Restore the backed up preferences from Dropbox with the following command:
```zsh
mackup restore
```

## Dotfiles Repo
Use stow to put your bash git vim & zsh config files into place with symbolic links

```zsh
cd ~/.dotfiles/macOS/
stow -nvSt ~ bash git vim zsh
stow -vSt ~ bash git vim zsh
```
