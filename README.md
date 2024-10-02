<h3 align="center">
  tux's NixOS Flake
</h3>
<p align="center">
  <a href="https://wakatime.com/badge/user/012e8da9-99fe-4600-891b-bd9d8dce73d9/project/312e6509-0e4f-47b7-b5de-54985b546702" target="_blank"><img alt="home" src="https://wakatime.com/badge/user/012e8da9-99fe-4600-891b-bd9d8dce73d9/project/312e6509-0e4f-47b7-b5de-54985b546702.svg"></a>
  <a href="https://builtwithnix.org" target="_blank"><img alt="home" src="https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a"></a>
  <a href="https://github.com/zemmsoares/awesome-rices" target="_blank"><img alt="home" src="https://raw.githubusercontent.com/zemmsoares/awesome-rices/main/assets/awesome-rice-badge.svg"></a>
</p>
<p align="center">
	<img src="https://github.com/user-attachments/assets/fc28c35f-b87a-4931-ae7f-c231a11fd1a3" alt="desktop">
</p>

## Table of Contents

- [Hosts](#hosts)
- [Installation](#installation)
- [Components](#components)
- [Showcase](#showcase)
- [Pain](#spent-weeks-on-this-system-configuration-)

## Hosts
|  | Type | Name | Hardware | Purpose
---|---|---|---|---
💻 | Desktop | sirius | Ryzen 5 3600 - 64GB RAM - RTX 3080 TI | Multi-monitor desktop running Windows Subsystem for Linux.
🖥️ | Laptop | canopus | Ryzen 9 5900HS - 16 GB RAM - RTX 3060 | Optimized for productivity on the go and some gaming.
☁️ | VPS | arcturus | 4 Core - 8 GB RAM | Primary server responsible for exposing my homelab applications to the internet.
🥔 | VPS | alpha | 2 Core - 4 GB RAM | Monitors uptime and health status of all services across the infrastructure.
🖥️ | Server | homelab | Ryzen 7 2700X - 32 GB RAM - 2060 Super | WIP, Migrating from unraid.
☁️ | VPS | node | i9-13900 - 64 GB RAM | Running Ethereum and BSC nodes. Currently in the process of migrating from Ubuntu.

## Installation

Hosts can be build with:

```
sduo nixos-rebuild switch --flake .#<HOSTNAME>
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

## Showcase

### Desktop

![2024-08-08_18-33](https://github.com/user-attachments/assets/1cdcc387-0f68-486c-a76c-a36ad2acb78d)

![2024-08-08_18-18](https://github.com/user-attachments/assets/f3fc4da5-6c0d-4cda-934d-b68ca6494e02)

### Neovim

![2024-08-08_18-16](https://github.com/user-attachments/assets/f881c672-8d77-43ec-b637-df5004c7d11f)

### Floating Terminal

![2024-08-08_18-16_1](https://github.com/user-attachments/assets/3339ecf8-3264-4179-a093-337c844592a6)

### Lazygit

![2024-08-08_18-16_2](https://github.com/user-attachments/assets/6df15881-fc2b-41b1-af3b-124fe0599b94)

### Telescope

![2024-08-08_18-16_3](https://github.com/user-attachments/assets/03be05bc-8ede-4d6e-a341-2761d89b7288)

### Firefox

![2024-08-08_18-26](https://github.com/user-attachments/assets/6f12173b-2480-404e-b01a-599115a886c0)

## Spent weeks on this system configuration 😢

<img src="https://user-images.githubusercontent.com/97862450/265550523-2f66a8b6-4347-40af-89c6-12db3a61cc7c.jpeg" width="50%" />
