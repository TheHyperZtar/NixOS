{ config, lib, pkgs, inputs, ... }:

{
  programs = {
    zsh.enable = true;
    nano.enable = false;
  };
}