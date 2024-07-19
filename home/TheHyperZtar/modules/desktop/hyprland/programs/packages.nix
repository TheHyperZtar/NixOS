{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    cinnamon.nemo-with-extensions
    cinnamon.nemo-fileroller
    cliphist
    font-manager
    grimblast
    jetbrains-mono
    libnotify
    networkmanagerapplet
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    pavucontrol
    slurp
    swappy
    swaynotificationcenter
    swww
    waypaper
    wl-clipboard
  ];
}

