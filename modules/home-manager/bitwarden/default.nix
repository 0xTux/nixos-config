{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    settings = {
      base_url = "https://bw.tux.rs";
      email = "0xtux@pm.me";
    };
  };

  home.packages = with pkgs; [
    bitwarden
  ];
}
