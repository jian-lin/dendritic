{
  description = "My determinate computering environment";

  inputs = {
    # keep-sorted start block=yes
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        # keep-sorted start
        flake-compat.follows = ""; # hack to avoid fetching unneeded inputs, see nix#7807
        gitignore.follows = "";
        nixpkgs.follows = "nixpkgs";
        # keep-sorted end
      };
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }:
      {
        imports =
          lib.fileset.fileFilter (file: file.hasExt "nix" && !lib.hasPrefix "_" file.name) ./modules
          |> lib.fileset.toList;

        systems = [
          "x86_64-linux"
        ];
      }
    );
}
