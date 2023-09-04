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
