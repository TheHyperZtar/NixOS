{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./games.nix
    ./emulators.nix
  ];
  home.packages = with pkgs; [
    goverlay
    mangohud
    protonup
  ];
}
