{ inputs, ... }:

{
  my.modules.nixos.nixos = {
    imports = [ inputs.home-manager.nixosModules.default ];
  };
}
