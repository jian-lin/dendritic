{
  inputs,
  config,
  ...
}:

let
  hostName = "machine0";
in
{
  flake.nixosConfigurations.${hostName} =
    let
      importProfiles = config.my.lib.importProfiles [
        "profilePc"
        "profileVm"
      ];
    in
    config.my.lib.mkNixosSystem {
      inherit (inputs.nixpkgs.lib) nixosSystem;
      nixosModule = {
        imports = [
          (importProfiles config.my.modules.nixos)
          config.my.modules.nixos.${hostName}
        ];
      };
      userToNixosModule = {
        inherit (config.my.modules.nixos) user0;
      };
      userToHomeManagerModule = {
        user0 = importProfiles config.my.modules.homeManager;
      };
      stateVersion = "25.05";
      inherit hostName;
    };
}
