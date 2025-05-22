{
  my.modules.nixos.sarasaFixedScNerdFont = {
    nixpkgs.overlays = [
      (final: _prev: {
        sarasa-fixed-sc-nerd-font = final.callPackage (
          {
            fetchurl,
            lib,
            stdenv,
            unzip,
          }:
          stdenv.mkDerivation (finalAttrs: {
            pname = "sarasa-fixed-sc-nerd-font";
            version = "1.0.27-0";

            src = fetchurl {
              url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${finalAttrs.version}/sarasa-fixed-sc-nerd-font.zip";
              hash = "sha256-jRIdDMm1LNrMe/u788zEFhNHPP4tss2B1JFcvIwAXKI=";
            };

            nativeBuildInputs = [
              unzip
            ];

            sourceRoot = ".";

            installPhase = ''
              runHook preInstall

              install -D -m 444 -t $out/share/fonts/truetype/sarasa-fixed-sc-nerd-font *.ttf

              runHook postInstall
            '';

            meta = {
              description = "Nerd fonts patched Sarasa Gothic font";
              homepage = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts";
              license = lib.licenses.mit;
            };
          })
        ) { };
      })
    ];
  };
}
