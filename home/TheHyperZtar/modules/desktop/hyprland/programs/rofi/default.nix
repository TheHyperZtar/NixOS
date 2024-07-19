{ config, lib, pkgs, inputs, ... }:

{
  xdg.configFile.rofi = {
    enable = true;
    source = ./themes;
    target = "/home/TheHyperZtar/.local/share/rofi/themes";
  };
  programs.rofi = {
    enable = true;
    font = "JetBrains Mono Bold 14";
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun,run";
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      hide-scrollbar = true;
      sidebar-mode = true;
      display-drun = "   Apps ";
      display-run = "   Command ";
      hover-select = true;
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
    };
    theme = lib.mkForce "catppuccin-macchiato.rasi";
  };
}
