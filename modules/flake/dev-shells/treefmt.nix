{ inputs, ... }:

{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { pkgs, config, ... }:
    {
      my.devShellsToBeMerged = [ config.devShells.treefmt ];
      devShells.treefmt = config.treefmt.build.devShell;

      treefmt = {
        programs = {
          # keep-sorted start block=yes
          deadnix.enable = true;
          keep-sorted.enable = true;
          nixfmt.enable = true;
          statix.enable = true;
          # keep-sorted end
        };
        settings.formatter = {
          # keep-sorted start block=yes
          deadnix.priority = config.treefmt.settings.formatter.statix.priority + 1;
          nixf-diagnose = {
            command = pkgs.nixf-diagnose;
            includes = [ "*.nix" ];
            priority = -1000; # run linters before formatters to get more readable output
          };
          statix.priority = config.treefmt.settings.formatter.nixf-diagnose.priority + 1;
          # keep-sorted end
        };
      };
    };
}
