{ ... }: {
  programs.steam = {
    enable = true;
  };

  hardware.opengl.driSupport32Bit = true;
}
