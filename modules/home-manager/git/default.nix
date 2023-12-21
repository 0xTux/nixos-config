{ ... }: {
  programs.git = {
    enable = true;
    userName = "0xTux";
    userEmail = "0xtux@pm.me";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgSign = true;
      gpg.format = "ssh";
    };
  };
}
