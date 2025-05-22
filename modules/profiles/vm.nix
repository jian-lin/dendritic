{ config, ... }:

{
  my.modules.nixos.profileVm.imports = builtins.attrValues {
    inherit (config.my.modules.nixos)
      vm
      ;
  };

  my.modules.homeManager.profileVm.imports = builtins.attrValues {
    # inherit (config.my.modules.homeManager)
    #   vm
    #   ;
  };
}
