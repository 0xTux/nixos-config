{...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = ''[󰊠  ](bold green)$directory(bold blue)$git_branch$git_status[❯](bold yellow)[❯](bold purple)[❯](bold blue) '';
      scan_timeout = 60;
      add_newline = false;

      line_break.disabled = true;
      directory.style = "bold blue";

      cmd_duration.format = "[$duration]($style) ";
      git_branch.format = "[$symbol$branch]($style) ";
      nodejs.format = "[$symbol($version )]($style)";
      rust.format = "[$symbol($version )]($style)";
      golang = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };
    };
  };
}
