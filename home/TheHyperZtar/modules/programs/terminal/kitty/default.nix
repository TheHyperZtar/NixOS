{ config, lib, pkgs, inputs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 15;
      font_family = "JetBrains Mono Bold";
      font_size = 14;
      background_opacity = "0.8";
    };
  };
}