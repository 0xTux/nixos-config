{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        bufferline = "multiple";

        "cursor-shape" = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
        }
      ];

      language-server = {
        nil = {
          command = "${pkgs.nil}/bin/nil";
          config.nil.formatting = {
            command = "${pkgs.alejandra}/bin/alejandra";
          };
        };
      };
    };
  };
}
