# Dotfiles Repository

This repository contains configuration files and scripts for various tools and applications. The dotfiles are organized based on the operating system and the specific device they are tailored for.

## Structure

The main directories in this repository represent different operating systems:

- `macOS`: Configurations for macOS devices.
- `linux`: Configurations for Linux environments and Linux-based servers.
- `windows`: Configurations for Windows environments.

## Details

### macOS

The `macOS` directory houses configurations for various macOS devices:

- `noether`: Dotfiles tailored for the "noether" laptop, which is the current M1 macbook laptop. Contains configurations for tools such as `git`, `gnupg`, `karabiner`, `kitty`, `neovim`, `ripgrep`, `sioyek`, `starship`, `tmux`, `zsh`, and other utilities and scripts. This is the most updated configuration for macOS devices.
- `calderon`: Specific configurations for the "calderon" laptop, which used to be an older intel-based macbook laptop. This configuration is most likely not up-to-date, but might have additional configuration files for certain applications that are no longer used on the newer laptop such as `neomutt`, `zathura` and `zmk`.
- `template`: A minimal setup designed for fresh MacBook setups. It provides essential configurations to quickly set up a new MacBook. Contains configurations for tools like `git`, `karabiner`, `kitty`, `neovim`, `starship`, `tmux`, `zsh` and more.

### Linux

This directory contains configurations for different Linux environments:

- `server`: Dotfiles for a Linux server environment, including configurations for `bash`, `vim`, `tmux` and `starship`.
- `wsl`: Dotfiles for the Windows Subsystem for Linux. Includes settings for a variety of tools and applications like `bash`, `git`, `neovim`, `zsh`, and more.

### Windows

This directory contains configurations and files tailored for Windows environments. It houses settings for `sioyek`, a list of Windows applications (`winget_apps.json`), and a comprehensive list of all Windows applications (`winget_apps_all.txt`).

---

For further details and to understand the configurations, navigate to the specific directories and refer to any available documentation or comments within the configuration files. One may also need to look into standard installation procedure for a given app to setup it up.
