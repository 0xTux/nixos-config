{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    #vscode = prev.vscode.overrideAttrs (oldAttrs: rec {
    #  src = (builtins.fetchTarball {
    #    url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64";
    #    sha256 = "09hy3nw1bblrl0blzpwv492gy0hwwbaq4csx00mcymskginz1wyx";
    #  });
    #  version = "latest";
    #  buildInputs = oldAttrs.buildInputs;
    #});

    awesome = inputs.nixpkgs-f2k.packages.${prev.system}.awesome-git.override {lua = prev.lua53Packages.lua;};
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
}
