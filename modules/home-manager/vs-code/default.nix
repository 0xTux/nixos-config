{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    keybindings = [
      {
        "key" = "f7";
        "command" = "-editor.action.wordHighlight.next";
        "when" = "editorTextFocus && hasWordHighlights";
      }
      {
        "key" = "f7";
        "command" = "-editor.action.accessibleDiffViewer.next";
        "when" = "isInDiffEditor";
      }
      {
        "key" = "f7";
        "command" = "workbench.action.terminal.toggleTerminal";
        "when" = "terminal.active";
      }
      {
        "key" = "ctrl+`";
        "command" = "-workbench.action.terminal.toggleTerminal";
        "when" = "terminal.active";
      }
    ];

    userSettings = {
      "window.zoomLevel" = 1;
      "workbench.colorTheme" = "Gruvbox Dark Hard";

      "editor" = {
        "fontFamily" = "FiraCode NF, FiraCode Nerd Font";
        "fontLigatures" = true;
      };

      "terminal.integrated.fontFamily" = "FiraCode NF, FiraCode Nerd Font , FiraCode";
    };

    extensions = with pkgs.vscode-extensions; [
      wakatime.vscode-wakatime
      ms-dotnettools.csharp
      naumovs.color-highlight
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker
      mikestead.dotenv
      golang.go
      jdinhlife.gruvbox
      wix.vscode-import-cost
      sumneko.lua
      yzhang.markdown-all-in-one
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      prisma.prisma
      ms-python.python
      ms-vscode-remote.remote-ssh
      humao.rest-client
      bradlc.vscode-tailwindcss
      gruntfuggly.todo-tree
    ];
  };
}
