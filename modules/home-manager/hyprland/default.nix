{pkgs, ...}: {
  programs = {
    waybar = {
      enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = let
      # Notify
      notifycmd = "notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low";

      # Elements
      hypr_border_size = 2;
      hypr_gaps_in = 5;
      hypr_gaps_out = 10;
      hypr_gaps_ws = -10;
      hypr_rounding = 10;
      groupbar_font_family = "Iosevka";
      groupbar_font_size = 10;

      # Colors
      active_border_col = "rgba(90ceaaff) rgba(ecd3a0ff) 45deg";
      inactive_border_col = "rgba(86aaeccc) rgba(93cee9cc) 45deg";
      active_shadow_col = "0x66000000";
      inactive_shadow_col = "0x66000000";
      group_border_active_col = "rgba(90ceaaff) rgba(ecd3a0ff) 45deg";
      group_border_inactive_col = "rgba(86aaeccc) rgba(93cee9cc) 45deg";
      group_border_locked_active_col = "rgba(90ceaaff) rgba(ecd3a0ff) 45deg";
      group_border_locked_inactive_col = "rgba(86aaeccc) rgba(93cee9cc) 45deg";
      groupbar_text_color = "0xFFf1fcf9";
    in {
      #-- General
      general = {
        border_size = hypr_border_size;
        gaps_in = hypr_gaps_in;
        gaps_out = hypr_gaps_out;
        gaps_workspaces = hypr_gaps_ws;
        "col.active_border" = active_border_col;
        "col.inactive_border" = inactive_border_col;
        layout = "master";
        resize_on_border = true;
      };

      #-- Decoration
      decoration = {
        rounding = hypr_rounding;
        active_opacity = 0.75;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 25;
        shadow_render_power = 3;
        "col.shadow" = active_shadow_col;
        "col.shadow_inactive" = inactive_shadow_col;

        blur = {
          enabled = true;
          size = 5;
          passes = 4;
          ignore_opacity = true;
          xray = true;
          special = true;
        };
      };

      #-- Animations
      animations = {
        enabled = true;
        first_launch_animation = true;
        animation = [
          "windowsIn,1,5,default,popin 0%"
          "windowsOut,1,5,default,popin"
          "windowsMove,1,5,default,slide"
          "fadeIn,1,8,default"
          "fadeOut,1,8,default"
          "fadeSwitch,1,8,default"
          "fadeShadow,1,8,default"
          "fadeDim,1,8,default"
          "border,1,10,default"
          "borderangle,1,10,default"
          "workspaces,1,5,default,slide"
          "specialWorkspace,1,5,default,fade"
        ];
      };

      #-- Input: Keyboard, Mouse, Touchpad
      input = {
        sensitivity = 0.5;
        scroll_method = "2 fg";
        natural_scroll = true;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = false;
        };
      };

      #-- Group
      group = {
        "col.border_active" = group_border_active_col;
        "col.border_inactive" = group_border_inactive_col;
        "col.border_locked_active" = group_border_locked_active_col;
        "col.border_locked_inactive" = group_border_locked_inactive_col;
        groupbar = {
          enabled = true;
          font_family = groupbar_font_family;
          font_size = groupbar_font_size;
          text_color = groupbar_text_color;
          "col.active" = group_border_active_col;
          "col.inactive" = group_border_inactive_col;
          "col.locked_active" = group_border_locked_active_col;
          "col.locked_inactive" = group_border_locked_inactive_col;
        };
      };

      #-- Miscellaneous
      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        focus_on_activate = true;
      };

      #-- Output
      monitor = ",preferred,auto,1";

      #-- Layout : Dwindle
      dwindle = {
        pseudotile = false;
        force_split = 0;
        preserve_split = false;
        smart_split = false;
        smart_resizing = true;
        permanent_direction_override = false;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        no_gaps_when_only = false;
        use_active_for_splits = true;
        default_split_ratio = 1.0;
      };

      #-- Layout : Master
      master = {
        allow_small_split = false;
        special_scale_factor = 0.8;
        mfact = 0.5;
        new_on_top = false;
        no_gaps_when_only = false;
        orientation = "left";
        inherit_fullscreen = true;
        always_center_master = false;
        smart_resizing = true;
        drop_at_cursor = true;
      };

      #-- Window Rules
      windowrule = [];

      #-- Keybindings
      bind = let
        terminal = "alacritty";
        browser = "firefox";
        filemanager = "thunar";
        editor = "geany";
      in [
        # groups
        "SUPER, G, togglegroup"
        "SUPER, G, exec, ${notifycmd} 'Toggled Group Mode'"
        "SUPER, H, changegroupactive, b"
        "SUPER, L, changegroupactive, f"
        "SUPER_SHIFT, L, lockactivegroup, toggle"
        "SUPER_SHIFT, L, exec, ${notifycmd} 'Toggled Group Lock'"

        # terminal
        "SUPER, Return, exec, ${terminal}"

        # apps
        "SUPER_SHIFT, F, exec, ${filemanager}"
        "SUPER_SHIFT, E, exec, ${editor}"
        "SUPER_SHIFT, B, exec, ${browser}"

        # hyprland
        "SUPER, Q, killactive,"
        "SUPER, C, killactive,"
        "CTRL_ALT, Delete, exit,"
        "SUPER, F, fullscreen, 0"
        "SUPER, F, exec, ${notifycmd} 'Fullscreen Mode'"
        "SUPER, S, pseudo,"
        "SUPER, S, exec, ${notifycmd} 'Pseudo Mode'"
        "SUPER, Space, togglefloating,"
        "SUPER, Space, centerwindow,"

        # change focus
        "SUPER, left,  movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up,    movefocus, u"
        "SUPER, down,  movefocus, d"

        # move active
        "SUPER_SHIFT, left,  movewindow, l"
        "SUPER_SHIFT, right, movewindow, r"
        "SUPER_SHIFT, up,    movewindow, u"
        "SUPER_SHIFT, down,  movewindow, d"

        # switch between windows
        "SUPER,Tab,cyclenext,"
        "SUPER,Tab,bringactivetotop,"

        # workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"

        # send to workspaces
        "SUPER_SHIFT, 1, movetoworkspace, 1"
        "SUPER_SHIFT, 2, movetoworkspace, 2"
        "SUPER_SHIFT, 3, movetoworkspace, 3"
        "SUPER_SHIFT, 4, movetoworkspace, 4"
        "SUPER_SHIFT, 5, movetoworkspace, 5"
        "SUPER_SHIFT, 6, movetoworkspace, 6"
        "SUPER_SHIFT, 7, movetoworkspace, 7"
        "SUPER_SHIFT, 8, movetoworkspace, 8"

        # seamless workspace switching
        "CTRL_ALT, left, workspace, e-1"
        "CTRL_ALT, right, workspace, e+1"
        "CTRL_ALT_SHIFT, left, movetoworkspace, e-1"
        "CTRL_ALT_SHIFT, right, movetoworkspace, e+1"

        # change workspace mode
        "SUPER_CTRL, F, workspaceopt, allfloat"
        "SUPER_CTRL, F, exec, ${notifycmd} 'Toggled All Float Mode'"
        "SUPER_CTRL, S, workspaceopt, allpseudo"
        "SUPER_CTRL, S, exec, ${notifycmd} 'Toggled All Pseudo Mode'"

        # misc
        "SUPER_SHIFT, P, pin,"
        "SUPER_SHIFT, P, exec, ${notifycmd} 'Toggled Pin'"
        "SUPER_SHIFT, S, swapnext"
      ];

      binde = [
        # resize active
        "SUPER_CTRL, left,  resizeactive, -20 0"
        "SUPER_CTRL, right, resizeactive, 20 0"
        "SUPER_CTRL, up,    resizeactive, 0 -20"
        "SUPER_CTRL, down,  resizeactive, 0 20"

        # move active (Floating Only)
        "SUPER_ALT, left,  moveactive, -20 0"
        "SUPER_ALT, right, moveactive, 20 0"
        "SUPER_ALT, up,    moveactive, 0 -20"
        "SUPER_ALT, down,  moveactive, 0 20"
      ];
      bindm = [
        # mouse buttons
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      "exec-once" = [
        "${pkgs.swaybg}/bin/swaybg -i ~/Wallpapers/moments_before_desk.png"
        "waybar"
      ];
    };
  };
}
