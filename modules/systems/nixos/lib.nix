{ lib, ... }:

{
  /**
    `mkNixosSystem` *`args`*

    Generate a NixOS configuration using home-manager a NixOS module.

    Each attribute of *`args`* is described below.

    # Inputs

    *`nixosSystem`* :: { modules :: [Module] } -> NixosSystem

    : Pass function `inputs.nixpkgs.lib.nixosSystem` to it.

    *`nixosModule`* :: Module

    : A module containing almost all NixOS config.

    *`userToNixosModule`* :: Map String Module

    : An attribute set mapping a user name to a NixOS module.  That module configures that user.

    *`userToHomeManagerModule`* :: Map String Module

    : An attribute set mapping a user to a home-manager module.  That module configures for that user.

    *`stateVersion`* :: String

    : Its value is passed to `system.stateVersion` (NixOS) and `home.stateVersion` (home-manager).

    *`hostName`* :: String

    : Its value is passed to `networking.hostName`.

    # Type

    ```
    mkNixosSystem :: Attrset -> NixosSystem
    ```
  */
  my.lib.mkNixosSystem =
    {
      nixosSystem,
      nixosModule,
      userToNixosModule,
      userToHomeManagerModule,
      stateVersion,
      hostName,
    }:
    nixosSystem {
      modules = [
        nixosModule
        {
          imports = lib.attrValues userToNixosModule;
          system = { inherit stateVersion; };
          networking = { inherit hostName; };
        }
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users = lib.mapAttrs (_user: homeManagerModule: {
              imports = [ homeManagerModule ];
              home = { inherit stateVersion; };
            }) userToHomeManagerModule;
          };
        }
      ];
    };
}
