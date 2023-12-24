<h1 align="center">
  0xTux/nixos-config
  
  [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
</h1>

# NixOS configuration flake
![desktop](https://github.com/0xTux/nixos-config/assets/97862450/0c24b770-027d-41a8-ba15-19069e8068cc)

## Installation

Currently there are 3 host's:
1. **canopus**
   - Asus Zephyrus G15
2. **wsl**
   - Windows Subsytem for Linux
3. **controller**
   - Hetzner VPS

Hosts can be build with:

```
sudo nixos-rebuild switch --flake .#<HOSTNAME>
```

## Components

|               | Wayland | Xorg             |
| ------------- | ------- | ---------------- |
| DM            | /       | SDDM             |
| WM/DE         | /       | AwesomeWM        |
| Compositor    | /       | Picom (Jonaburg) |
| Bar           | /       | Wibar            |
| Hotkeys       | /       | Awful            |
| Launcher      | /       | Rofi             |
| Notifications | /       | Naughty          |
| Terminal      | /       | Alacritty        |
| Editor        | /       | Neovim           |

**Spent weeks on this system configuration 😢**

<img src="https://user-images.githubusercontent.com/97862450/265550523-2f66a8b6-4347-40af-89c6-12db3a61cc7c.jpeg" width="50%" />

