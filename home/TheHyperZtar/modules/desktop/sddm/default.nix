{ config, lib, pkgs, inputs, ... }:

{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
      package = pkgs.kdePackages.sddm;
    };
    autoLogin = {
      enable = true;
      user = "TheHyperZtar";
    };
  };
  
  environment.systemPackages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];
}
