{ ... }: {
  programs.rofi = {
    enable = true;
    extraConfig = ''
          configuration {
          terminal: "alacritty";

          modes: "combi,keys";

          display-window: "window";
          display-drun: "run";
          display-windowcd: "windowcd";
          display-run: "run";
          display-ssh: "ssh";
          display-combi: "combi";
          display-keys: "keys";
          display-filebrowser: "filebrowser";

          combi-modes: "window,drun";
          combi-hide-mode-prefix: false;
          combi-display-format: "<i>{mode}</i> {text}";

          window-format: "<span fgalpha='65%'>[{w:-1}] </span><b>{c:-1}</b> <span weight='light' fgalpha='65%' size='small'>{t:-1}</span>";
          window-thumbnail: false;

          drun-url-launcher: "xdg-open";
          drun-match-fields: "name,generic,exec,categories,keywords";
          drun-display-format: "<b>{name}</b>[ <span weight='light' size='small'><i>({generic})</i></span>][ <span weight='light' fgalpha='65%' size='small'>{exec}</span>]";
          drun-show-actions: true;
          drun {
              parse-user: true;
              parse-system: true;
          }

          run-command: "{cmd}";
          run-list-command: "";
          run-shell-command: "{terminal} -e {cmd}";

          filebrowser {
              directories-first: true;
              sorting-method: "name";
          }

          timeout {
              action: "kb-cancel";
              delay:  0;
          }

          matching: "normal";
          font: "monospace 11";
          show-icons: true;
          scroll-method: 0;
          cycle: false;
          fixed-num-lines: false;
      }

      @theme "theme"
    '';
    theme = ''
            * {
          font: "JetBrains Mono 11";

          black: #1d1f21;
          white: #c5c8c6;
          red: #cc6666;
          orange: #de935f;
          yellow: #f0c674;
          green: #7cb36b;
          cyan: #78bab9;
          blue: #81a2be;
          magenta: #b294bb;

          black-bright: #3c4044;
          white-bright: #eaeaea;
          red-bright: #d54e53;
          orange-bright: #e78c45;
          yellow-bright: #e7c547;
          green-bright: #71c464;
          cyan-bright: #6acdcc;
          blue-bright: #7aa6da;
          magenta-bright: #c397d8;

          black-66: #131415;
          white-66: #828382;
          red-66: #864343;
          orange-66: #92613e;
          yellow-66: #9e824c;
          green-66: #517646;
          cyan-66: #4f7a7a;
          blue-66: #556a7d;
          magenta-66: #75617b;

          black-33: #090a0a;
          white-33: #414141;
          red-33: #432121;
          orange-33: #49301f;
          yellow-33: #4f4126;
          green-33: #283b23;
          cyan-33: #273d3d;
          blue-33: #2a353e;
          magenta-33: #3a303d;

          common-background: @black;
          common-background-bright: @black-bright;
          common-background-66: @black-66;
          common-foreground: @white;
          common-foreground-bright: @white-bright;
          common-foreground-66: @white-66;
          common-primary: @yellow;
          common-primary-bright: @yellow-bright;
          common-primary-66: @yellow-66;
          common-primary-33: @yellow-33;
          common-secondary: @blue;
          common-secondary-bright: @blue-bright;
          common-secondary-66: @blue-66;
          common-secondary-33: @blue-33;
          common-urgent: @red;
          common-urgent-bright: @red-bright;
          common-urgent-66: @red-66;
          common-urgent-33: @red-33;

          background-color: transparent;

          normal-normal-background: transparent;
          normal-normal-foreground: @common-foreground;
          normal-normal-border-color: transparent;
          normal-active-background: transparent;
          normal-active-foreground: @common-secondary-bright;
          normal-active-border-color: transparent;
          normal-urgent-background: transparent;
          normal-urgent-foreground: @common-urgent-bright;
          normal-urgent-border-color: transparent;

          selected-normal-background: @common-primary-33;
          selected-normal-foreground: @common-primary-bright;
          selected-normal-border-color: @common-primary-66;
          selected-active-background: @common-secondary-33;
          selected-active-foreground: @common-secondary-bright;
          selected-active-border-color: @common-secondary-66;
          selected-urgent-background: @common-urgent-33;
          selected-urgent-foreground: @common-urgent-bright;
          selected-urgent-border-color: @common-urgent-66;

          alternate-normal-background: @normal-normal-background;
          alternate-normal-foreground: @normal-normal-foreground;
          alternate-normal-border-color: @normal-normal-border-color;
          alternate-active-background: @normal-active-background;
          alternate-active-foreground: @normal-active-foreground;
          alternate-active-border-color: @normal-active-border-color;
          alternate-urgent-background: @normal-urgent-background;
          alternate-urgent-foreground: @normal-urgent-foreground;
          alternate-urgent-border-color: @normal-urgent-border-color;
      }

      window {
          background-color: #1d1f21d9; // @black + 0.85 alpha
          border: 3;
          border-color: @black-bright;
          border-radius: 16;
          width: 1024;
          height: 460;
      }

      mainbox {
          padding: 16;
          spacing: 16;
      }

      inputbar {
          background-color: #333537; // @black-110
          border: 1;
          border-color: #606263; // @black-130
          border-radius: 8;
          padding: 12 16;
          spacing: 0;
          text-color: @common-foreground;
          children: [ "entry", "case-indicator", "num-filtered-rows", "textbox-num-sep", "num-rows"];
      }

      prompt {
          background-color: transparent;
          text-color: @common-foreground-bright;
          spacing: 0;
          text-transform: bold;
      }

      textbox-prompt-colon {
          background-color: transparent;
          text-color: inherit;
          margin: 0 0.3em 0 0;
          expand: false;
          str: ":";
      }

      entry {
          background-color: transparent;
          text-color: @common-foreground-bright;
          cursor: text;
          placeholder-color: @common-foreground-66;
          placeholder: "Type to filter";
      }

      case-indicator {
          background-color: transparent;
          text-color: inherit;
      }

      num-filtered-rows {
          background-color: transparent;
          text-color: inherit;
          expand: false;
      }

      textbox-num-sep {
          background-color: transparent;
          text-color: inherit;
          expand: false;
          str: "/";
      }

      num-rows {
          background-color: transparent;
          text-color: inherit;
          expand: false;
      }

      message {
          background-color: @cyan-33;
          border: 1;
          border-color: @cyan-66;
          border-radius: 8;
          padding: 16;
      }

      textbox {
          background-color: transparent;
          text-color: @cyan-bright;
      }

      listview {
          dynamic: true;
          scrollbar: true;
          spacing: 0;
      }

      scrollbar {
          background-color: transparent;
          padding: 0;
          margin: 0 0 0 4;
          handle-width: 8;
          border: 0;
          handle-color: #626463; // @white-50
      }

      element {
          border: 1;
          border-radius: 8;
          padding: 6 12;
          margin: 1 0;
          spacing: 12;
          children: [ element-icon, element-text ];
      }

      element-icon {
          background-color: transparent;
          text-color: inherit;
          size: 1.0em;
          cursor: inherit;
      }

      element-text {
          background-color: transparent;
          text-color: inherit;
          highlight: inherit;
          cursor: inherit;
      }

      element normal.normal {
          background-color: @normal-normal-background;
          text-color: @normal-normal-foreground;
          border-color: @normal-normal-border-color;
      }

      element normal.urgent {
          background-color: @normal-urgent-background;
          text-color: @normal-urgent-foreground;
          border-color: @normal-urgent-border-color;
      }

      element normal.active {
          background-color: @normal-active-background;
          text-color: @normal-active-foreground;
          border-color: @normal-active-border-color;
      }

      element selected.normal {
          background-color: @selected-normal-background;
          text-color: @selected-normal-foreground;
          border-color: @selected-normal-border-color;
      }

      element selected.urgent {
          background-color: @selected-urgent-background;
          text-color: @selected-urgent-foreground;
          border-color: @selected-urgent-border-color;
      }

      element selected.active {
          background-color: @selected-active-background;
          text-color: @selected-active-foreground;
          border-color: @selected-active-border-color;
      }

      element alternate.normal {
          background-color: @alternate-normal-background;
          text-color: @alternate-normal-foreground;
          border-color: @alternate-normal-border-color;
      }

      element alternate.urgent {
          background-color: @alternate-urgent-background;
          text-color: @alternate-urgent-foreground;
          border-color: @alternate-urgent-border-color;
      }

      element alternate.active {
          background-color: @alternate-active-background;
          text-color: @alternate-active-foreground;
          border-color: @alternate-active-border-color;
      }
    '';
  };
}
