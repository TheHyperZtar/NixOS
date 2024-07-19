{ config, lib, pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    userName = "TheHyperZtar";
    userEmail = "thehyperztar@gmail.com";
  };
}

