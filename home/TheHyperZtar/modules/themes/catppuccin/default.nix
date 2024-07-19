{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  home.sessionVariables = lib.mkForce {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
  };
  catppuccin = {
    enable = true;
    accent = "sky";
    flavor = "macchiato";
    pointerCursor.enable = true;
    pointerCursor.accent = "sky";
    pointerCursor.flavor = "macchiato";
  };
  wayland.windowManager.hyprland.catppuccin = {
    enable = true;
    accent = "sky";
    flavor = "macchiato";
  };
  gtk = with pkgs; {
    enable = true;
    font = {
      name = "Noto Sans";
      size = 12;
      package = noto-fonts;
    };
    catppuccin = {
      enable = true;
      accent = "sky";
      flavor = "macchiato";
      icon.enable = true;
      icon.accent = "sky";
      icon.flavor = "macchiato";
    };
  };
  qt = with pkgs; {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
      catppuccin = {
        enable = true;
        apply = true;
        accent = "sky";
        flavor = "macchiato";
      };
    };
  };
  programs.bat = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.btop = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.cava = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.kitty = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.mpv = {
    catppuccin = {
      enable = true;
      accent = "sky";
      flavor = "macchiato";
    };
  };
  programs.neovim = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.rofi = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.waybar = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
  programs.zsh.syntaxHighlighting = {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };
  };
}