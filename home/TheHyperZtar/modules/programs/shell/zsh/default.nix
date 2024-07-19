{ config, lib, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --upgrade --flake /home/TheHyperZtar/.config/nixos#THZ-PC";
    };
    oh-my-zsh = {
      enable = true;
      theme = "nanotech";
      plugins = [
        "git"
        "sudo"
      ];
    };
  };
}