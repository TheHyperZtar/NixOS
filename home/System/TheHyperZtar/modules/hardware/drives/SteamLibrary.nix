{ ... }:

{
  fileSystems = {
    "/run/media/TheHyperZtar/THZ-SSD/Steam\ Library" = {
      device = "/dev/disk/by-label/THZ-SSD";
      fsType = "btrfs";
      options = [ "subvol=SteamLibrary" "noatime" "nofail" ];
    };
  };
}
