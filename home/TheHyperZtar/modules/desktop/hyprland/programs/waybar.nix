{ config, lib, pkgs, inputs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        spacing = 4;
        modules-left = [ "custom/apps" "group/shortcuts" "custom/spotify" "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "custom/update" "group/hardware" "battery" "backlight" "pulseaudio" "custom/cliphist" "custom/swaync" "clock" "tray" "custom/powermenu" ];
        "custom/apps" = {
          format = "";
          on-click = "sleep 0.1 ; rofi -show drun -show-icons";
          tooltip = false;
        };
        "custom/waypaper" = {
          format = "";
          on-click = "waypaper";
          on-click-middle = "pkill waybar;waybar &";
          tooltip = false;
        };
        "custom/nemo" = {
          format = "";
          on-click = "nemo";
          tooltip = false;
        };
        "custom/firefox" = {
          format = "󰈹";
          on-click = "firefox";
          tooltip = false;
        };
        "custom/steam" = {
          format = "";
          on-click = "steam";
          tooltip = false;
        };
        "custom/spotify" = {
          exec = "python3 ~/.config/waybar/modules/mediaplayer.py --player spotify";
          format = "{}  ";
          return-type = "json";
          on-click = "playerctl -p spotify play-pause";
          on-scroll-up = "playerctl -p spotify next";
          on-scroll-down = "playerctl -p spotify previous";
          tooltip = false;
        };
        "custom/update" = {
          format = "";
          on-click = "kitty -e sudo nixos-rebuild switch --upgrade --flake /etc/nixos#";
          tooltip = false;
        };
        "custom/cliphist" = {
          format = "󱉥";
          on-click = "sleep 0.1 && cliphist list | rofi -dmenu -no-show-icons -p Clipboard -theme ~/.local/share/rofi/themes/catppuccin-macchiato-compat.rasi| cliphist decode | wl-copy";
          on-click-right = "sleep 0.1 && cliphist list | rofi -dmenu -no-show-icons -p Clipboard -theme ~/.local/share/rofi/themes/catppuccin-macchiato-compat.rasi| cliphist delete";
          on-click-middle = "sleep 0.1 && cliphist wipe";
          tooltip = false;
        };
        "custom/swaync" = {
          format = "";
          on-click = "sleep 0.1;swaync-client -t";
          on-click-right = "swaync-client -C";
          tooltip = false;
        };
        "custom/powermenu" = {
          format = "󰐥";
          on-click = "sleep 0.1 ; ~/.local/bin/powermenu.sh";
          tooltip = false;
        };
        "group/shortcuts" = {
          orientation = "horizontal";
          modules = [
            "custom/waypaper"
            "custom/nemo"
            "custom/firefox"
            "custom/steam"
          ];
        };
        "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
          ];
        };
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        "cpu" = {
          format = " {usage}%";
          on-click = "kitty -e btop";
          tooltip = false;
        };
        "memory" = {
          format = "/  {}%";
          on-click = "kitty -e btop";
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "󰝟 {icon} {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
        on-click = "pavucontrol";
        };
        "clock" = {
          format = "{:%I:%M %p}";
          format-alt = "{:%d %B, %Y}";
          tooltip = true;
          tooltip-format = "<big>{:%I:%M %p}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            format = {
              today = "<span color='#ee99a0'><b><u>{}</u></b></span>";
            };
            mode = "month";
          };
        };
        "tray" = {
          spacing = 10;
        };
      };
    };
    style = ''
      #waybar {
        font-family: "JetBrains Mono", "Symbols Nerd Font Mono";
        font-size: 16px;
        font-weight: bold;
        background: transparent;
        color: @sky;
        background-color: @base;
        border-bottom-right-radius: 10px;
        border-bottom-left-radius: 10px;
      }
      button {
        all: unset;
        transition: all 0.3s ease-in-out;
        padding: 0px 10px;
        border-radius: 15px;
        margin-left: 2px;
        margin-right: 2px;
      }
      button:hover {
        background-color: @surface1;
      }
      button.active {
        background-color: @surface0;
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #tray,
      #custom-swaync,
      #custom-waypaper,
      #custom-spotify,
      #custom-apps,
      #custom-nemo,
      #custom-steam,
      #custom-firefox,
      #custom-update,
      #custom-cliphist,
      #custom-powermenu,
      #workspaces,
      #mpd {
        padding-left: 10px;
        padding-right: 10px;
      }
      #custom-powermenu {
        color: @red;
      }
      #memory {
        padding-left: 0px;
      }
      tooltip {
        background-color: @base;
        border: none;
        border-radius: 10px;
      }
      tooltip decoration {
        box-shadow: none;
      }
      tooltip decoration:backdrop {
        box-shadow: none;
      }
      tooltip label {
        color: @sky;
        font-family: "JetBrains Mono";
        font-weight: bold;
        font-size: 16px;
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 0px;
        padding-bottom: 5px;
      }
    '';
  };
}
