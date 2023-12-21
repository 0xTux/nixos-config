<h1 align="center">
  0xTux/nixos-config
  
  [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
</h1>

# NixOS configuration flake

## Installation

Currently there is 1 host:
1. canopus
   - UEFI boot w/ systemd-boot
2. wsl
   - Windows Subsytem for Linux

Hosts can be build with:

```
sudo nixos-rebuild switch --flake .#<HOSTNAME>
```

## Components

|               | Wayland    | Xorg             |
|---------------|------------|------------------|
| DM            | /          | SDDM             |
| WM/DE         | /          | AwesomeWM        |
| Compositor    | /          | Picom (Jonaburg) |
| Bar           | /          | Wibar            |
| Hotkeys       | /          | Awful            |
| Launcher      | /          | Rofi             |
| Notifications | Dunst      | Naughty          |
| Terminal      | Alacritty  | Alacritty        |
| Editor        | Neovim     | Neovim           |

**Spent weeks on this system configuration 😢**

<img src="https://user-images.githubusercontent.com/97862450/265550523-2f66a8b6-4347-40af-89c6-12db3a61cc7c.jpeg" width="50%" />

