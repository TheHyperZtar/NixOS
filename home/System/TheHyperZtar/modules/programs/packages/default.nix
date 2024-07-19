{ config, lib, pkgs, inputs, ... }:

{
  programs.appimage.enable = true;

  programs.file-roller.enable = true;

  programs.ns-usbloader.enable = true;

  services.hardware.openrgb.enable = true;

  services.ratbagd.enable = true;
}
