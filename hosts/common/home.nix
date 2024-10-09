{
  outputs,
  username,
  inputs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../../modules/home-manager/shell
    ../../modules/home-manager/git
    ../../modules/home-manager/starship
    ../../modules/home-manager/nvim
    ../../modules/home-manager/tmux
    ../../modules/home-manager/helix
    ../../modules/home-manager/aria2
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.nur
      outputs.overlays.nix-vscode-extensions
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      joypixels.acceptLicense = true;
    };
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
