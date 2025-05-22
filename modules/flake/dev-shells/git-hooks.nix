{ inputs, ... }:

{
  imports = [
    inputs.git-hooks-nix.flakeModule
  ];

  perSystem =
    { config, ... }:
    {
      my.devShellsToBeMerged = [ config.devShells.git-hooks ];
      devShells.git-hooks = config.pre-commit.devShell;

      pre-commit = {
        settings.hooks = {
          treefmt.enable = true;
          markdownlint.enable = true;
        };
      };
    };
}
