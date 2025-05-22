{ inputs, ... }:

{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { config, ... }:
    {
      my.devShellsToBeMerged = [ config.devShells.treefmt ];
      devShells.treefmt = config.treefmt.build.devShell;

      treefmt = {
        programs = {
          # keep-sorted start block=yes
          deadnix = {
            enable = true;
            priority = -100;
          };
          keep-sorted.enable = true;
          nixf-diagnose = {
            enable = true;
            priority = -100;
          };
          nixfmt.enable = true;
          statix = {
            enable = true;
            priority = -100;
          };
          # keep-sorted end
        };
      };
    };
}
