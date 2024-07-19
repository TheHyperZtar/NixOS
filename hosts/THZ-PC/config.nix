{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-config.nix
    inputs.disko.nixosModules.default
    (import ./disko.nix {device = "/dev/nvme0n1";})
    inputs.home-manager.nixosModules.default
    ./users/TheHyperZtar
    ./../../home/System/TheHyperZtar
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot Options
  boot = {
    supportedFilesystems = ["ntfs" "exfat" "ext4" "fat32" "btrfs"];
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      timeout = 0;
      grub.enable = true;
      grub.device = "nodev";
      grub.efiSupport = true;
      grub.efiInstallAsRemovable = true;
      grub.timeoutStyle = "hidden";
    };
  };

  # System Options
  networking.hostName = "THZ-PC";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Mazatlan";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    keyMap = "la-latin1";
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    blueman.enable = true;
    printing.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "latam";
      excludePackages = with pkgs; [
        xterm
      ];
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };
  };

  security = {
    polkit.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.dconf.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      rocmSupport = true;
    };
  };

  system.stateVersion = "24.05";
}
