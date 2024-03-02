{config, ...}: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      terminal = "alacritty";

      modes = "combi,keys";

      display-window = "window";
      display-drun = "run";
      display-windowcd = "windowcd";
      display-run = "run";
      display-ssh = "ssh";
      display-combi = "combi";
      display-keys = "keys";
      display-filebrowser = "filebrowser";

      combi-modes = "window,drun";
      combi-hide-mode-prefix = false;
      combi-display-format = "<i>{mode}</i> {text}";

      window-format = "<span fgalpha='65%'>[{w=-1}] </span><b>{c=-1}</b> <span weight='light' fgalpha='65%' size='small'>{t=-1}</span>";
      window-thumbnail = false;

      drun-url-launcher = "xdg-open";
      drun-match-fields = "name,generic,exec,categories,keywords";
      drun-display-format = "<b>{name}</b>[ <span weight='light' size='small'><i>({generic})</i></span>][ <span weight='light' fgalpha='65%' size='small'>{exec}</span>]";
      drun-show-actions = true;

      run-command = "{cmd}";
      run-list-command = "";
      run-shell-command = "{terminal} -e {cmd}";

      matching = "normal";
      font = "JetBrains Mono 11";
      show-icons = true;
      scroll-method = 0;
      cycle = false;
      fixed-num-lines = false;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        font = "JetBrains Mono 11";

        black = mkLiteral "#1d1f21";
        white = mkLiteral "#c5c8c6";
        red = mkLiteral "#cc6666";
        orange = mkLiteral "#de935f";
        yellow = mkLiteral "#f0c674";
        green = mkLiteral "#7cb36b";
        cyan = mkLiteral "#78bab9";
        blue = mkLiteral "#81a2be";
        magenta = mkLiteral "#b294bb";

        black-bright = mkLiteral "#3c4044";
        white-bright = mkLiteral "#eaeaea";
        red-bright = mkLiteral "#d54e53";
        orange-bright = mkLiteral "#e78c45";
        yellow-bright = mkLiteral "#e7c547";
        green-bright = mkLiteral "#71c464";
        cyan-bright = mkLiteral "#6acdcc";
        blue-bright = mkLiteral "#7aa6da";
        magenta-bright = mkLiteral "#c397d8";

        black-66 = mkLiteral "#131415";
        white-66 = mkLiteral "#828382";
        red-66 = mkLiteral "#864343";
        orange-66 = mkLiteral "#92613e";
        yellow-66 = mkLiteral "#9e824c";
        green-66 = mkLiteral "#517646";
        cyan-66 = mkLiteral "#4f7a7a";
        blue-66 = mkLiteral "#556a7d";
        magenta-66 = mkLiteral "#75617b";

        black-33 = mkLiteral "#090a0a";
        white-33 = mkLiteral "#414141";
        red-33 = mkLiteral "#432121";
        orange-33 = mkLiteral "#49301f";
        yellow-33 = mkLiteral "#4f4126";
        green-33 = mkLiteral "#283b23";
        cyan-33 = mkLiteral "#273d3d";
        blue-33 = mkLiteral "#2a353e";
        magenta-33 = mkLiteral "#3a303d";

        common-background = mkLiteral "@black";
        common-background-bright = mkLiteral "@black-bright";
        common-background-66 = " @black-66";
        common-foreground = mkLiteral "@white";
        common-foreground-bright = mkLiteral "@white-bright";
        common-foreground-66 = mkLiteral "@white-66";
        common-primary = mkLiteral "@yellow";
        common-primary-bright = mkLiteral "@yellow-bright";
        common-primary-66 = mkLiteral "@yellow-66";
        common-primary-33 = mkLiteral "@yellow-33";
        common-secondary = mkLiteral "@blue";
        common-secondary-bright = mkLiteral "@blue-bright";
        common-secondary-66 = mkLiteral "@blue-66";
        common-secondary-33 = mkLiteral "@blue-33";
        common-urgent = mkLiteral "@red";
        common-urgent-bright = mkLiteral "@red-bright";
        common-urgent-66 = mkLiteral "@red-66";
        common-urgent-33 = mkLiteral "@red-33";

        background-color = mkLiteral "transparent";

        normal-normal-background = mkLiteral "transparent";
        normal-normal-foreground = mkLiteral "@common-foreground";
        normal-normal-border-color = mkLiteral "transparent";
        normal-active-background = mkLiteral "transparent";
        normal-active-foreground = mkLiteral "@common-secondary-bright";
        normal-active-border-color = mkLiteral "transparent";
        normal-urgent-background = mkLiteral "transparent";
        normal-urgent-foreground = mkLiteral "@common-urgent-bright";
        normal-urgent-border-color = mkLiteral "transparent";

        selected-normal-background = mkLiteral "@common-primary-33";
        selected-normal-foreground = mkLiteral "@common-primary-bright";
        selected-normal-border-color = mkLiteral "@common-primary-66";
        selected-active-background = mkLiteral "@common-secondary-33";
        selected-active-foreground = mkLiteral "@common-secondary-bright";
        selected-active-border-color = mkLiteral "@common-secondary-66";
        selected-urgent-background = mkLiteral "@common-urgent-33";
        selected-urgent-foreground = mkLiteral "@common-urgent-bright";
        selected-urgent-border-color = mkLiteral "@common-urgent-66";

        alternate-normal-background = mkLiteral "@normal-normal-background";
        alternate-normal-foreground = mkLiteral "@normal-normal-foreground";
        alternate-normal-border-color = mkLiteral "@normal-normal-border-color";
        alternate-active-background = mkLiteral "@normal-active-background";
        alternate-active-foreground = mkLiteral "@normal-active-foreground";
        alternate-active-border-color = mkLiteral "@normal-active-border-color";
        alternate-urgent-background = mkLiteral "@normal-urgent-background";
        alternate-urgent-foreground = mkLiteral "@normal-urgent-foreground";
        alternate-urgent-border-color = mkLiteral "@normal-urgent-border-color";
      };

      "window" = {
        background-color = mkLiteral "#1d1f21e6"; #// @black + 0.85 alpha
        border = 3;
        border-color = mkLiteral "@black-bright";
        border-radius = 16;
        width = 1024;
        height = 460;
      };

      "mainbox" = {
        padding = 16;
        spacing = 16;
      };

      "inputbar" = {
        background-color = mkLiteral "#333537"; #// @black-110
        border = 1;
        border-color = mkLiteral "#606263"; #// @black-130
        border-radius = 8;
        padding = mkLiteral "12 16";
        spacing = 0;
        text-color = mkLiteral "@common-foreground";
        children = mkLiteral "[ entry, case-indicator, num-filtered-rows, textbox-num-sep, num-rows ]";
      };

      "prompt" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@common-foreground-bright";
        spacing = 0;
        text-transform = mkLiteral "bold";
      };

      "textbox-prompt-colon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        margin = mkLiteral "0 0.3em 0 0";
        expand = false;
        str = "=";
      };

      "entry" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@common-foreground-bright";
        cursor = "text";
        placeholder-color = mkLiteral "@common-foreground-66";
        placeholder = "Type to filter";
      };

      "case-indicator" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
      };

      "num-filtered-rows" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        expand = false;
      };

      "textbox-num-sep" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        expand = false;
        str = "/";
      };

      "num-rows" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        expand = false;
      };

      "message" = {
        background-color = mkLiteral "@cyan-33";
        border = 1;
        border-color = mkLiteral "@cyan-66";
        border-radius = 8;
        padding = 16;
      };

      "textbox" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@cyan-bright";
      };

      "listview" = {
        dynamic = true;
        scrollbar = true;
        spacing = 0;
      };

      "scrollbar" = {
        background-color = mkLiteral "transparent";
        padding = 0;
        margin = mkLiteral "0 0 0 4";
        handle-width = 8;
        border = 0;
        handle-color = mkLiteral "#626463"; #// @white-50
      };

      "element" = {
        border = 1;
        border-radius = 8;
        padding = mkLiteral "6 12";
        margin = mkLiteral "1 0";
        spacing = 12;
        children = mkLiteral "[ element-icon, element-text ]";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "1.0em";
        cursor = mkLiteral "inherit";
      };

      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@normal-normal-background";
        text-color = mkLiteral "@normal-normal-foreground";
        border-color = mkLiteral "@normal-normal-border-color";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "@normal-urgent-background";
        text-color = mkLiteral "@normal-urgent-foreground";
        border-color = mkLiteral "@normal-urgent-border-color";
      };

      "element normal.active" = {
        background-color = mkLiteral "@normal-active-background";
        text-color = mkLiteral "@normal-active-foreground";
        border-color = mkLiteral "@normal-active-border-color";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
        border-color = mkLiteral "@selected-normal-border-color";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "@selected-urgent-background";
        text-color = mkLiteral "@selected-urgent-foreground";
        border-color = mkLiteral "@selected-urgent-border-color";
      };

      "element selected.active" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
        border-color = mkLiteral "@selected-active-border-color";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "@alternate-normal-background";
        text-color = mkLiteral "@alternate-normal-foreground";
        border-color = mkLiteral "@alternate-normal-border-color";
      };

      "element alternate.urgent" = {
        background-color = mkLiteral "@alternate-urgent-background";
        text-color = mkLiteral "@alternate-urgent-foreground";
        border-color = mkLiteral "@alternate-urgent-border-color";
      };

      "element alternate.active" = {
        background-color = mkLiteral "@alternate-active-background";
        text-color = mkLiteral "@alternate-active-foreground";
        border-color = mkLiteral "@alternate-active-border-color";
      };
    };
  };
}
