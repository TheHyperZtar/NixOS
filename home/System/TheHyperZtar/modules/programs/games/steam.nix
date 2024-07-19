{ config, lib, pkgs, inputs, ... }:

{
  imports = [ ./../../hardware/drives/SteamLibrary.nix ];
  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}