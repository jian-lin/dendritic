{
  my.modules.nixos.machine0 = {
    nixpkgs.hostPlatform = "x86_64-linux";

    # dummy hardware config to make "nix flake check" happy
    # FIXME replace this with content of your hardware-configuration.nix
    fileSystems."/" = {
      device = "/dev/FIXME";
    };
    boot.loader.grub.device = "nodev";
  };
}
