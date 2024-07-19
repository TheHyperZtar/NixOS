{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./modules/desktop/sddm
    ./modules/desktop/hyprland
    ./modules/themes/catppuccin
    ./modules/programs/games/steam.nix
    ./modules/programs/shell/zsh
    ./modules/programs/misc/waydroid
    ./modules/programs/packages
  ];
}