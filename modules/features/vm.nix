{
  my.modules.nixos.vm = {
    virtualisation.vmVariant.virtualisation = {
      cores = 4;
      memorySize = 4096;
      diskSize = 5 * 1024;
    };
  };
}
