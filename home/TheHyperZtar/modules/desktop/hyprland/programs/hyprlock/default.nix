{ config, lib, pkgs, inputs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = [
        {
          monitor = "";
          path = "~/Dropbox/TheHyperZtar/Pictures/Wallpapers/Saul Goodman.png";
          blur_passes = 0;
          color = "rgb(24273a)";
        }
      ];
      label = [
        {
          monitor = "";
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "rgb(cad3f5)";
          font_size = 90;
          font_family = "JetBrains Mono";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "rgb(cad3f5)";
          font_size = 25;
          font_family = "JetBrains Mono";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];
      image = [
        {
          monitor = "";
          path = "~/Dropbox/TheHyperZtar/Pictures/User Pictures/TheHyperZtar.png";
          size = 100;
          border_color = "rgb(91d7e3)";
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(91d7e3)";
          inner_color = "rgb(363a4f)";
          font_color = "rgb(cad3f5)";
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##cad3f5"><i>󰌾 Logged in as </i><span foreground="##91d7e3">$USER</span></span>'';
          hide_input = false;
          check_color = "rgb(91d7e3)";
          fail_color = "rgb(ed8796)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(eed49f)";
          position = "0, -35";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
