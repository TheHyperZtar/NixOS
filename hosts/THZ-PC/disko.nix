{ device ? throw, ... }:
{
  disko.devices = {
    disk.main = {
      inherit device;
      type = "disk";
      content = {
      	type = "gpt";
        partitions = {
          THZ-BOOT = {
            name = "THZ-BOOT";
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              extraArgs = [ "-n THZ-BOOT" ];
              mountOptions = [ "noatime" ];
             };
           };
          THZ-NixOS = {
            name = "THZ-NixOS";
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f -L THZ-NixOS" ];
              subvolumes = {
              	"/Root" = {
                  mountOptions = [ "noatime" ];
                  mountpoint = "/";
                 };

                "/Home" = {
                  mountOptions = [ "noatime" ];
                  mountpoint = "/home";
                 };

                "/Nix" = {
                  mountOptions = [ "noatime" ];
                  mountpoint = "/nix";
                };

                "/Swap" = {
                  mountOptions = [ "noatime" "nofail" ];
                  mountpoint = "/swap";
                  swap = {
                    swapfile.size = "8G";
                    swapfile.path = "swapfile";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

