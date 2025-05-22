{ lib, ... }:

{
  /**
    `importProfiles` *`profiles`* *`modules`*

    Return a module with its `imports` set to the modules selected from *`modules`* using *`profiles`*.

    # Inputs

    *`profiles`* :: [String]

    : A list of profile names.

    *`modules`* :: Map String Module

    : An attribute set mapping a profile name to its module.  If a profile name is in *`profiles`*, its module is selected.

    # Type

    ```
    importProfiles :: [String] -> Map String Module -> [Module]
    ```

    # Example

    ```nix
    nix-repl> importProfiles [ "profile0" ] { profile0 = <<module0>>; profile1 = <<module1>>; }
    [ <<module0>> ]
    ```
  */
  my.lib.importProfiles = profiles: modules: {
    imports = lib.attrValues (lib.filterAttrs (profile: _module: lib.elem profile profiles) modules);
  };
}
