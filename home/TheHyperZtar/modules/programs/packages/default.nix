{ config, lib, pkgs, inputs, ... }:

{
  programs.yt-dlp.enable = true;
  home.packages = with pkgs; [
    dropbox
    gimp
    gparted
    handbrake
    hplip
    hunspell
    hunspellDicts.es-mx
    libreoffice-fresh
    lxqt.lximage-qt
    picard
    piper
    qalculate-gtk
    smile
    smplayer
    vscodium
    webcord
    wineWowPackages.stable
    zapzap
  ];
}
