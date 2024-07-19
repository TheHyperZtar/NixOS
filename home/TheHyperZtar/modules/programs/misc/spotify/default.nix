{ config, lib, pkgs, inputs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spotify-player = {
    enable = true;
  };
  programs.spicetify = {
    enable = true;
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.catppuccin;
    colorScheme = "macchiato";
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
      adblock
      volumePercentage
    ];
    enabledCustomApps = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.apps; [
      localFiles
    ];
  };
}