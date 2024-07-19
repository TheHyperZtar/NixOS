{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./modules/desktop/hyprland
    ./modules/programs/browser/firefox
    ./modules/programs/cli/btop
    ./modules/programs/cli/cava
    ./modules/programs/cli/git
    ./modules/programs/editor/neovim
    ./modules/programs/editor/vscode
    ./modules/programs/games
    ./modules/programs/misc/mpv
    ./modules/programs/misc/obs-studio
    ./modules/programs/misc/spotify
    ./modules/programs/packages
    ./modules/programs/shell/zsh
  ];
}