{ ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        bold.family = "JetBrainsMono Nerd Font";
        italic.family = "JetBrainsMono Nerd Font";
        bold_italic.family = "JetBrainsMono Nerd Font";
        size = 10;
      };

      window = {
        padding = {
          x = 15;
          y = 15;
        };

        decorations = "none";
        opacity = 1.0;
        dynamic_title = true;
        history = 10000;
        multiplier = 3;
      };

      selection.save_to_clipboard = false;

      live_config_reload = true;

      colors = {
        primary = {
          background = "#0f0f0f";
          foreground = "0xa6accd";
        };
        normal = {
          black = "0x1b1e28";
          red = "0xd0679d";
          green = "0x5de4c7";
          yellow = "0xfffac2";
          blue = "0x89ddff";
          magenta = "0xfcc5e9";
          cyan = "0xadd7ff";
          white = "0xffffff";
        };
        bright = {
          black = "0xa6accd";
          red = "0xd0679d";
          green = "0x5de4c7";
          yellow = "0xfffac2";
          blue = "0xadd7ff";
          magenta = "0xfae4fc";
          cyan = "0x89ddff";
          white = "0xffffff";
        };
        cursor = {
          cursor = "#bb9af7";
          text = "CellBackground";
        };
        search = {
          matches = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };
          focused_match = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };
          footer_bar = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };
        };
        selection = {
          text = "CellForeground";
          background = "0x303340";
        };
        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };
      };
    };
  };
}
