{ lib, ... }:

{
  options.my.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.raw;
    default = { };
    description = "My helper functions.";
  };

  config.my.lib = {
    /**
      `mkNoDefaultPackageOption` *`name`* *`example`*

      Like `lib.mkPackageOption`, but no default value is set, and an example is required.

      # Inputs

      *`name`* :: String

      : A generic name of the package.

      *`example`* :: String

      : A specific example of the package.

      # Type

      ```
      mkNoDefaultPackageOption :: String -> String -> Option
      ```

      # Examples

      ```nix
      nix-repl> mkNoDefaultPackageOption "app launcher" "wofi"
      <<option>>
      ```
    */
    mkNoDefaultPackageOption =
      name: example:
      lib.mkPackageOption (abort "mkNoDefaultPackageOption: broken") name {
        default = null;
        example = [ example ];
      };
  };
}
