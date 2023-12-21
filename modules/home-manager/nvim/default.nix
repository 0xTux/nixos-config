{ inputs, pkgs, ... }: {
  xdg.configFile = {
    "nvim".source = inputs.astronvim;
    "astronvim".source = ./astronvim;
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = false;
      vimAlias = true;

      withPython3 = true;
      withNodeJs = true;
    };
  };

  home = {
    packages = with pkgs; [
      gcc
      neovide
      #-- python
      nodePackages.pyright # python language server
      python311Packages.black # python formatter

      #-- nix
      nil
      rnix-lsp
      statix # Lints and suggestions for the nix programming language
      deadnix # Find and remove unused code in .nix source files
      alejandra # Nix Code Formatter

      #-- golang
      go
      gomodifytags
      iferr # generate error handling code for go
      impl # generate function implementation for go
      gotools # contains tools like: godoc, goimports, etc.
      gopls # go language server
      delve # go debugger

      #-- lua
      stylua
      lua-language-server
      luarocks

      #-- bash
      nodePackages.bash-language-server
      shellcheck
      shfmt

      #-- javascript/typescript --#
      nodePackages.typescript
      nodePackages.typescript-language-server

      #-- Misc
      hadolint # Dockerfile linter
      tree-sitter # common language parser/highlighter
      nodePackages.prettier # common code formatter

      #-- Optional Requirements:
      gdu # disk usage analyzer, required by AstroNvim
      ripgrep # fast search tool, required by AstroNvim's '<leader>fw'(<leader> is space key)
    ];
  };
}
