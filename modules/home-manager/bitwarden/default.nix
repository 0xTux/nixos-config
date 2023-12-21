{ pkgs, ... }: {

  programs.rbw = {
    enable = true;
    settings = {
      base_url = "https://vault.0xtux.com";
      email = "0xtux@pm.me";
    };
  };

  home.packages = with pkgs; [
    bitwarden
  ];
}
