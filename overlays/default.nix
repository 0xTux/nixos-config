{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    awesome = inputs.nixpkgs-f2k.packages.${prev.system}.awesome-git;

    discord = prev.discord.override {
      withOpenASAR = true;
      withVencord = true;
    };
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  nur = inputs.nur.overlay;

  nix-vscode-extensions = inputs.nix-vscode-extensions.overlays.default;
}
