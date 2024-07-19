{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./programs/hyprlock
    ./../../themes/catppuccin
    ./../../programs/terminal/kitty
    ./programs/waybar.nix
    ./programs/rofi
    ./programs/packages.nix
  ];
  xdg.configFile.hyprland = {
    enable = true;
    source = ./scripts;
    target = "/home/TheHyperZtar/.local/bin";
  };
  home.packages = with pkgs; [
    polkit_gnome
  ];

  dconf.settings = {
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "kitty";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      "$mainMod" = "SUPER";
      monitor = [
        ",highres,auto,1"
        "DP-3,1920x1080@165,0x0,1"
        "HDMI-A-2,1920x1080@60,0x-1080,1,mirror,DP-3"
      ];
      env = [
        "XCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS,1"
        "MOZ_ENABLE_WAYLAND,1"
      ];
      exec-once = [
        "waybar &"
        "swww-daemon -f xrgb &"
        "swaync &"
        "nm-applet --indicator & blueman-applet & dropbox"
        "wl-paste --watch cliphist store"
      ];
      input = {
        kb_layout = "latam";
        follow_mouse = 1;
        numlock_by_default = true;
        touchpad = {
          disable_while_typing = false;
          natural_scroll = false;
          middle_button_emulation = true;
        };
      };
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        resize_on_border = true;
        layout = "dwindle";
        "col.active_border" = "$accent 90deg";
        "col.inactive_border" = "$text";
      };
      decoration = {
        rounding = 10;
        dim_special = 0.0;
        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
        blur = {
          enabled = false;
          size = 2;
          passes = 3;
          new_optimizations = true;
        };
      };
      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      misc = {
        disable_hyprland_logo = true;
        vfr = true;
        vrr = true;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
        new_on_top = true;
        mfact = 0.5;
      };
      windowrule = [
        "float,^(pavucontrol)$"
        "float,^(.blueman-manager-wrapped)$"
        "float,^(nm-connection-editor)$"
        "float,^(waypaper)$"
        "float,^(file-roller)$"
        "float,^(it.mijorus.smile)$"
        "float,^(qalculate-gtk)$"
        "forceinput,^(robloxplayerbeta.exe)$"
        "fullscreen,^(robloxplayerbeta.exe)$"
        "fullscreen,^(Waydroid)$"
        "fullscreen,^(steam_app_813230)$"
        "noborder,^(emulationstation)$"
        "noborder,^(Xdg-desktop-portal-gtk)$"
      ];
      windowrulev2 = [
        "suppressevent maximize,class:^(libreoffice.*)$"
        "stayfocused, title:^()$,class:^(steam)$"
        "minsize 1 1, title:^()$,class:^(steam)$"
      ];
      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, E, exec, nemo"
        "$mainMod, T, togglefloating"
        "$mainMod, B, exec, firefox"
        "$mainMod, R, exec, rofi -show drun -show-icons"
        "$mainMod, PERIOD, exec, smile"
        "$mainMod, J, togglesplit"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, P, exec, ~/.local/bin/powermenu.sh"
        ", XF86PowerOff, exec, ~/.local/bin/powermenu.sh"
        ", PRINT, exec, ~/.local/bin/screenshot.sh"
        "$mainMod SHIFT, B, exec, pkill waybar;waybar &"
        "$mainMod, Menu, exec, cliphist list | rofi -dmenu -no-show-icons -p Clipboard -theme ~/.local/share/rofi/themes/catppuccin-macchiato-compat.rasi| cliphist decode | wl-copy"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod SHIFT, right, resizeactive, 100 0"
        "$mainMod SHIFT, left, resizeactive, -100 0"
        "$mainMod SHIFT, up, resizeactive, 0 -100"
        "$mainMod SHIFT, down, resizeactive, 0 100"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];
      binde = [
        "$mainMod, KP_ADD, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        "$mainMod, KP_SUBTRACT, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        "$mainMod SHIFT, KP_ADD, exec, brightnessctl set +5%"
        "$mainMod SHIFT, KP_SUBTRACT, exec, brightnessctl set 5%-"
      ];
      bindm =  [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
