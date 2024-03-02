{...}: {
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          position = "top";
          layer = "top";
          height = 35;
          margin-top = 0;
          margin-bottom = 0;
          margin-left = 0;
          margin-right = 0;
          exclusive = true;
          passthrough = false;

          modules-left = [
            "custom/l_end"
            "cpu"
            "memory"
            "custom/r_end"
          ];
          modules-center = [
            "custom/l_end"
            "hyprland/workspaces"
            "custom/r_end"
          ];
          modules-right = [
            "custom/l_end"
            "network"
            "bluetooth"
            "battery"
            "tray"
            "custom/r_end"
          ];

          "hyprland/workspaces" = {
            "disable-scroll" = true;
            "all-outputs" = true;
            "active-only" = false;
            "on-click" = "activate";
            "persistent-workspaces" = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
            };
          };

          "network" = {
            "tooltip" = true;
            "format-wifi" = "  <span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
            "format-ethernet" = "󰈀 <span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
            "tooltip-format" = "Network= <big><b>{essid}</b></big>\nSignal strength= <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency= <b>{frequency}MHz</b>\nInterface= <b>{ifname}</b>\nIP= <b>{ipaddr}/{cidr}</b>\nGateway= <b>{gwaddr}</b>\nNetmask= <b>{netmask}</b>";
            "format-linked" = "󰈀 {ifname} (No IP)";
            "format-disconnected" = "󰖪 ";
            "tooltip-format-disconnected" = "Disconnected";
            "interval" = 2;
          };

          "battery" = {
            "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 20;
            };
            "format" = "{icon} {capacity}%";
            "format-charging" = " {capacity}%";
            "format-plugged" = " {capacity}%";
            "format-alt" = "{time} {icon}";
            "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          };

          "bluetooth" = {
            "format" = "";
            "format-disabled" = "";
            "format-connected" = " {num_connections}";
            "format-connected-battery" = "{icon} {num_connections}";
            # "format-connected-battery"= "{icon} {device_alias}-{device_battery_percentage}%";
            "format-icons" = ["󰥇" "󰤾" "󰤿" "󰥀" "󰥁" "󰥂" "󰥃" "󰥄" "󰥅" "󰥆" "󰥈"];
            # "format-device-preference"= [ "device1"; "device2" ]; // preference list deciding the displayed device If this config option is not defined or none of the devices in the list are connected; it will fall back to showing the last connected device.
            "tooltip-format" = "{controller_alias}\n{num_connections} connected";
            "tooltip-format-connected" = "{controller_alias}\n{num_connections} connected\n\n{device_enumerate}";
            "tooltip-format-enumerate-connected" = "{device_alias}";
            "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{icon} {device_battery_percentage}%";
          };

          "memory" = {
            "states" = {
              "c" = 90; # critical
              "h" = 60; # high
              "m" = 30; # medium
            };
            "interval" = 30;
            "format" = "󰾆 {used}GB";
            "format-m" = "󰾅 {used}GB";
            "format-h" = "󰓅 {used}GB";
            "format-c" = " {used}GB";
            "format-alt" = "󰾆 {percentage}%";
            "max-length" = 10;
            "tooltip" = true;
            "tooltip-format" = "󰾆 {percentage}%\n {used=0.1f}GB/{total=0.1f}GB";
          };

          "cpu" = {
            "interval" = 10;
            "format" = "󰍛 {usage}%";
            "format-alt" = "{icon0}{icon1}{icon2}{icon3}";
            "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          };

          "tray" = {
            "icon-size" = 14;
            "spacing" = 5;
          };

          "custom/l_end" = {
            "format" = " ";
            "interval" = "once";
            "tooltip" = false;
          };

          "custom/r_end" = {
            "format" = " ";
            "interval" = "once";
            "tooltip" = false;
          };

          "custom/sl_end" = {
            "format" = " ";
            "interval" = "once";
            "tooltip" = false;
          };

          "custom/sr_end" = {
            "format" = " ";
            "interval" = "once";
            "tooltip" = false;
          };

          "custom/rl_end" = {
            "format" = " ";
            "interval" = "once";
            "tooltip" = false;
          };

          "custom/rr_end" = {
            "format" = " ";
            "interval" = "once";
            "tooltip" = false;
          };

          "custom/padd" = {
            "format" = "  ";
            "interval" = "once";
            "tooltip" = false;
          };
        };
      };
      style = let
        bar_bg = "rgba(23, 28, 34, 0.95)";
        main_bg = "#101419";
        main_fg = "#93cee9";

        wb_act_bg = "#90ceaa";
        wb_act_fg = "#1f2328";

        wb_hvr_bg = "#90ceaa";
        wb_hvr_fg = "#1f2328";
      in ''
        * {
            border: none;
            border-radius: 0px;
            font-family: "JetBrainsMono Nerd Font";
            font-weight: bold;
            font-size: 20px;
            min-height: 10px;
        }

        window#waybar {
            background: ${bar_bg};
        }

        tooltip {
            background: ${main_bg};
            color: ${main_fg};
            border-radius: 7px;
            border-width: 0px;
        }

        #workspaces button {
            box-shadow: none;
        	text-shadow: none;
            padding: 0px;
            border-radius: 9px;
            margin-top: 3px;
            margin-bottom: 3px;
            margin-left: 0px;
            padding-left: 3px;
            padding-right: 3px;
            margin-right: 0px;
            color: ${main_fg};
            animation: ws_normal 20s ease-in-out 1;
        }

        #workspaces button.active {
            background: ${wb_act_bg};
            color: ${wb_act_fg};
            margin-left: 3px;
            padding-left: 12px;
            padding-right: 12px;
            margin-right: 3px;
            animation: ws_active 20s ease-in-out 1;
            transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #workspaces button:hover {
            background: ${wb_hvr_bg};
            color: ${wb_hvr_fg};
            animation: ws_hover 20s ease-in-out 1;
            transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #taskbar button {
            box-shadow: none;
        	  text-shadow: none;
            padding: 0px;
            border-radius: 9px;
            margin-top: 3px;
            margin-bottom: 3px;
            margin-left: 0px;
            padding-left: 3px;
            padding-right: 3px;
            margin-right: 0px;
            color: @wb-color;
            animation: tb_normal 20s ease-in-out 1;
        }

        #taskbar button.active {
            background: ${wb_act_bg};
            color: @wb-act-color;
            margin-left: 3px;
            padding-left: 12px;
            padding-right: 12px;
            margin-right: 3px;
            animation: tb_active 20s ease-in-out 1;
            transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #taskbar button:hover {
            background: ${wb_hvr_bg};
            color: @wb-hvr-color;
            animation: tb_hover 20s ease-in-out 1;
            transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #backlight,
        #battery,
        #bluetooth,
        #custom-cliphist,
        #clock,
        #custom-cpuinfo,
        #cpu,
        #custom-gpuinfo,
        #idle_inhibitor,
        #language,
        #memory,
        #custom-mode,
        #mpris,
        #network,
        #custom-power,
        #pulseaudio,
        #custom-spotify,
        #taskbar,
        #tray,
        #custom-updates,
        #custom-wallchange,
        #custom-wbar,
        #window,
        #workspaces,
        #custom-l_end,
        #custom-r_end,
        #custom-sl_end,
        #custom-sr_end,
        #custom-rl_end,
        #custom-rr_end {
            color: ${main_fg};
            background: ${main_bg};
            opacity: 1;
            margin: 4px 0px 4px 0px;
            padding-left: 4px;
            padding-right: 4px;
        }

        #workspaces,
        #taskbar {
            padding: 0px;
        }

        #custom-r_end {
            border-radius: 0px 21px 21px 0px;
            margin-right: 9px;
            padding-right: 3px;
        }

        #custom-l_end {
            border-radius: 21px 0px 0px 21px;
            margin-left: 9px;
            padding-left: 3px;
        }

        #custom-sr_end {
            border-radius: 0px;
            margin-right: 9px;
            padding-right: 3px;
        }

        #custom-sl_end {
            border-radius: 0px;
            margin-left: 9px;
            padding-left: 3px;
        }

        #custom-rr_end {
            border-radius: 0px 7px 7px 0px;
            margin-right: 9px;
            padding-right: 3px;
        }

        #custom-rl_end {
            border-radius: 7px 0px 0px 7px;
            margin-left: 9px;
            padding-left: 3px;
        }
      '';
    };
  };
}
