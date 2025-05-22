{ lib, moduleLocation, ... }:

let
  inherit (lib.strings) escapeNixIdentifier;

  addInfo =
    class: moduleName:
    if class == "generic" then
      module: module
    else
      module: {
        _class = class;
        _file = "${toString moduleLocation}#modules.${escapeNixIdentifier class}.${escapeNixIdentifier moduleName}";
        key = "${toString moduleLocation}#modules.${escapeNixIdentifier class}.${escapeNixIdentifier moduleName}";
        imports = [ module ];
      };
in
{
  options.my.modules = lib.mkOption {
    type = lib.types.lazyAttrsOf (lib.types.lazyAttrsOf lib.types.deferredModule);
    description = ''
      This is basicly flake-parts.flakeModules.modules with two modifications:
        - key is added to each module to help module deduplication (flake-parts#251)
        - modules are not published to the flake output
    '';
    apply = lib.mapAttrs (class: lib.mapAttrs (addInfo class));
  };
}
