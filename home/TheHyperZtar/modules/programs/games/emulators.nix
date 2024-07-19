{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    dolphin-emu
    pcsx2
    retroarch
    ryujinx
  ];
}
