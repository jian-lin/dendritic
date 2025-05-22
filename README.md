# Dendritic

Configs for [NixOS][]/[home-manager][]/[nix-darwin][] systems.

## Design

Follow [the Dendritic Pattern][pattern]:

- put configs for each concern/feature into one place
- with the help of [flake-part][] modules: every file is a flake-part [module][module-system].

## Organization

- `modules/features/`
  - configs for one concern/feature which may contain
    - NixOS config
    - home-manager config
    - nix-darwin config
  - use flake-parts modules to put these configs into one place
- `modules/profiles/`:
  - organize features
  - a profile is a list of features or profiles
- `modules/systems/`:
  - organize systems
  - system kinds
    - NixOS system
    - standalone home-manager system (not implemented)
    - nix-darwin system (not implemented)
  - a system is a list of profiles or features
  - support multiple users
- `modules/flake/`:
  - general flake config
    - system
    - flake check
    - flake fmt
  - devShells config

File names are only informative.  They do not affect config.
What matters to config is module names, such as `my.modules.nixos.feature0` and `my.modules.homeManager.feature0`.

## Functionality

- devShell
  - enter it using `nix develop` or [direnv][]
  - available features
    - [treefmt][]: run formatters and some linters in one commmand
    - [nixd][], a language server for Nix
    - [pre-commit][git-hooks]: run all formatters and linters
- flake checks
  - run it using `nix flake check`
- flake formatter
  - run it using `nix fmt`

## Try this config in a VM

```bash
nix build .#nixosConfigurations.machine0.config.system.build.vm
NIX_DISK_IMAGE=~/test-vm-disk.qcow2 ./result/bin/run-machine0-vm
```

## Debug

Check the [debug guide][] of flake-parts.

Here is an example to check the doc of a custom lib function:

```console
$ nix repl .
nix-repl> :doc debug.my.lib.mkNoDefaultPackageOption
```

## Best practices

- [nix.dev][best-practices]

## License

AGPL-3.0-or-later

[pattern]: https://github.com/mightyiam/dendritic
[flake-part]: https://flake.parts/
[nix-darwin]: https://github.com/nix-darwin/nix-darwin
[nixd]: https://github.com/nix-community/nixd
[treefmt]: https://github.com/numtide/treefmt-nix
[git-hooks]: https://github.com/cachix/git-hooks.nix
[home-manager]: https://github.com/nix-community/home-manager
[NixOS]: https://nixos.org/manual/nixos/stable/
[best-practices]: https://nix.dev/guides/best-practices
[module-system]: https://nix.dev/tutorials/module-system/
[direnv]: https://github.com/direnv/direnv
[debug guide]: https://flake.parts/debug
