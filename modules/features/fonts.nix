{
  my.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts = {
        fontconfig = {
          allowBitmaps = false;
          defaultFonts = {
            monospace = [
              "Sarasa Fixed SC Nerd Font"
            ];
            sansSerif = [
              "Sarasa UI SC"
              "Sarasa UI J"
              "Sarasa UI K"
            ];
            serif = [
              "Source Han Serif"
              "Source Han Serif SC"
              "Source Han Serif TC"
              "Source Han Serif HC"
              "Source Han Serif K"
            ];
          };
        };
        packages = builtins.attrValues {
          inherit (pkgs)
            sarasa-fixed-sc-nerd-font
            sarasa-gothic
            source-han-serif
            ;
        };
      };
    };
}
