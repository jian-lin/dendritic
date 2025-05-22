{
  debug = true;

  perSystem =
    { pkgs, config, ... }:
    {
      my.devShellsToBeMerged = [ config.devShells.nixd ];

      devShells.nixd = pkgs.mkShellNoCC {
        packages = builtins.attrValues {
          inherit (pkgs) nixd nixfmt-rfc-style;
        };
      };
    };
}
