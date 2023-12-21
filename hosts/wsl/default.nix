{ config, lib, pkgs, inputs, username, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  wsl.enable = true;
  wsl.defaultUser = "${username}";

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      initialPassword = "${username}";
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "storage" ];
      openssh.authorizedKeys.keys = [
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL+OzPUe2ECPC929DqpkM39tl/vdNAXfsRnmrGfR+X3D 0xtux@pm.me''
      ];
    };
  };

  environment.systemPackages = with pkgs;[
    ollama
  ];

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; }) ];

  system.stateVersion = "23.11";
}
