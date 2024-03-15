{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.power-theme.overrideAttrs (_: {
          src = fetchFromGitHub {
            owner = "wfxr";
            repo = "tmux-power";
            rev = "2e362c50e5772ba1d13a00628baba558b4220f41";
            sha256 = "sha256-1hjQXC7261DiwrZ54PiwMLJM62srmP8koPNnTEp2zdI=";
          };
        });
        extraConfig = "
          set -g @tmux_power_theme '#83A3C2'
          set -g @tmux_power_right_arrow_icon ''
          set -g @tmux_power_left_arrow_icon ''
        ";
      }
    ];
    extraConfig = "

       set-option -sa terminal-overrides \",xterm*:Tc\"
       set -g mouse on  
       set-option -g status-position top
       set-option -g allow-rename off
       unbind r
       bind r source-file ~/.config/tmux/tmux.conf

       # remap prefix from C-b to C-Space
       # unbind C-b
       # set -g prefix C-Space
       # bind C-Space send-prefix

       # split panes using | and -
       unbind '\"'
       unbind %
       bind | split-window -h
       bind - split-window -v

       # Start windows and panes at 1, not 0
       set -g base-index 1
       set -g pane-base-index 1
       set-window-option -g pane-base-index 1
       set-option -g renumber-windows on
    
       # switch panes using Alt-arrow without prefix
       bind -n M-Left select-pane -L
       bind -n M-Right select-pane -R
       bind -n M-Up select-pane -U
       bind -n M-Down select-pane -D

      ";
  };
}
