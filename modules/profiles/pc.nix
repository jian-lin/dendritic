{ config, ... }:

{
  my.modules.nixos.profilePc.imports = builtins.attrValues {
    inherit (config.my.modules.nixos)
      users
      nixos
      profileHyprland
      input
      network
      ssh
      time
      fonts
      sarasaFixedScNerdFont
      inputMethod
      ;
  };

  my.modules.homeManager.profilePc.imports = builtins.attrValues {
    inherit (config.my.modules.homeManager)
      profileHyprland
      neovim
      inputMethod
      ;
  };
}
