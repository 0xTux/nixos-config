{
  pkgs,
  username,
  ...
}: {
  programs.thunderbird = {
    enable = true;
    package = pkgs.betterbird;

    profiles."${username}" = {
      isDefault = true;
    };
  };
}
