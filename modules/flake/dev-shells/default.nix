{
  perSystem =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      options.my.devShellsToBeMerged = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "devShells to be merged into a default one.";
      };

      config.devShells.default = pkgs.mkShellNoCC {
        inputsFrom = config.my.devShellsToBeMerged;
      };
    };
}
