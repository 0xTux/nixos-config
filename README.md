<h1 align="center">
  0xTux/nixos-config

  [![wakatime](https://wakatime.com/badge/user/012e8da9-99fe-4600-891b-bd9d8dce73d9/project/312e6509-0e4f-47b7-b5de-54985b546702.svg)](https://wakatime.com/badge/user/012e8da9-99fe-4600-891b-bd9d8dce73d9/project/312e6509-0e4f-47b7-b5de-54985b546702)
  [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)
</h1>

# NixOS configuration flake
![desktop](https://github.com/user-attachments/assets/4cc09401-4616-4a8e-968d-d7a2ffc8ae66)

## Installation

Currently there are 3 host's:
1. **canopus**
   - Asus Zephyrus G15
2. **wsl**
   - Windows Subsytem for Linux
3. **controller**
   - Headscale
   - Vaultwarden
   - Gitea
   - Uptime Kuma
   - Grafana, Loki, Promtail

Hosts can be build with:

```
nh os switch -H <HOSTNAME>
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
| Terminal      | /       | Wezterm          |
| Editor        | /       | Neovim           |

**Spent weeks on this system configuration 😢**

<img src="https://user-images.githubusercontent.com/97862450/265550523-2f66a8b6-4347-40af-89c6-12db3a61cc7c.jpeg" width="50%" />

