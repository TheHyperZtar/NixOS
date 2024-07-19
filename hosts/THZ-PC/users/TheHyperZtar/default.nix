{ config, lib, pkgs, inputs, ... }:

{
  users.users.TheHyperZtar = {
    isNormalUser = true;
    extraGroups = [ "input" "networkmanager" "wheel" "gamemode" ];
    createHome = true;
    home = "/home/TheHyperZtar";
    initialPassword = "1234";
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users."TheHyperZtar" = {
      imports = [ ./../../../../home/TheHyperZtar ];
      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
        };
        portal = {
          enable = true;
          extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
          configPackages = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
        };
      };

      home.username = "TheHyperZtar";
      home.homeDirectory = "/home/TheHyperZtar";
      home.stateVersion = "24.05";
      home.packages = with pkgs; [
      ];

      programs.home-manager.enable = true;

    };
  };
}
