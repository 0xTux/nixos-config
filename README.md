<h1 align="center">
  0xTux/nixos-config
  
  [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
</h1>

# NixOS configuration flake

## Installation

Currently there is 1 host:
1. sirius
   - UEFI boot w/ systemd-boot

Hosts can be build with:

```
sudo nixos-rebuild switch --flake .#<HOSTNAME>
```

## Components

|               | Wayland    | Xorg             |
|---------------|------------|------------------|
| DM            | TTY1 Login | SDDM             |
| WM/DE         | Hyprland   | BSPWM            |
| Compositor    | Hyprland   | Picom (Jonaburg) |
| Bar           | /          | Polybar + Eww    |
| Hotkeys       | Hyprland   | Sxhkd            |
| Launcher      | /          | Rofi             |
| Notifications | Dunst      | Dunst            |
| Terminal      | Alacritty  | Alacritty        |
| Editor        | Neovim     | Neovim           |

**Spent weeks on this system configuration 😢**

<img src="https://user-images.githubusercontent.com/97862450/265550523-2f66a8b6-4347-40af-89c6-12db3a61cc7c.jpeg" width="50%" />

