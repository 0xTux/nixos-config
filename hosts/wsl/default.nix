{
  pkgs,
  inputs,
  username,
  config,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  nixpkgs = {
    config.cudaSupport = true;
    hostPlatform = "x86_64-linux";
  };

  wsl = {
    enable = true;
    defaultUser = "${username}";
    nativeSystemd = true;
    useWindowsDriver = true;
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking.hostName = "wsl";

  programs = {
    ssh.startAgent = true;
    zsh.enable = true;
    nix-ld = {
      enable = true;
      libraries = config.hardware.opengl.extraPackages;
    };
    dconf.enable = true;
  };

  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
      };
    };
    tailscale.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      initialPassword = "${username}";
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "storage"];
      openssh.authorizedKeys.keys = [
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL+OzPUe2ECPC929DqpkM39tl/vdNAXfsRnmrGfR+X3D 0xtux@pm.me''
      ];
    };
  };

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];

  system.stateVersion = "23.11";
}
