{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    am2rlauncher
    prismlauncher
    ringracers
    srb2
  ];
}
