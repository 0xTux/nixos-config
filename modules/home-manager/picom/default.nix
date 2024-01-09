{ config, pkgs, ... }: {
  services.picom = {
    enable = true;

    fade = true;
    fadeDelta = 5;
    fadeSteps = [ 0.05 0.05 ];
    fadeExclude = [
      "window_type *= 'menu'"
    ];

    settings = {
      experimental-backend = true;
      backend = "xrender";
      use-damage = false;

      corner-radius = 0;

      animations = true;
      animation-stiffness = 500;
      animation-window-mass = 1.0;
      animation-dampening = 26;
      animation-delta = 10;
      animation-force_steps = false;
      animation-clamping = true;

      animation-for-open-window = "slide-up";
      animation-for-menu-window = "slide-down";
      animation-for-transient-window = "slide-down";
      animation-for-unmap-window = "slide-up";
      animation-for-prev-tag = "slide-left";
      enable-fading-prev-tag = true;
      animation-for-next-tag = "slide-right";
      enable-fading-next-tag = true;

      active-opacity = 0.95;
      inactive-opacity = 0.95;
      opacity-rule = [ "100:class_g = 'firefox'" ];

      shadow = false;
      shadow-radius = 20;
      shadow-offset-x = -20;
      shadow-offset-y = -18;

      no-fading-openclose = false;

      vsync = true;
    };
  };
}
