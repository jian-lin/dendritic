dir:

{ lib, ... }:

let
  /**
    # Type

    ```
    isNixFile :: String -> Bool
    ```
  */
  isNixFile = lib.hasSuffix ".nix";

  /**
    # Type

    ```
    isIgnored :: String -> Bool
    ```
  */
  isIgnored = lib.hasInfix "/_";

  /**
    `filterWithString` *`f`* *`paths`*

    Like `filter`, but each item is `toString`ed before passed to *`f`*.

    # Inputs

    *`f`* :: String -> Bool

    : Same as *`f`* of `filter`.

    *`paths`* :: [Path]

    : Same as *`paths`* of `filter`.

    # Type

    ```
    filterWithString :: (String -> Bool) -> [Path] -> [Path]
    ```
  */
  filterWithString = f: files: lib.filter (file: (f (toString file))) files;

  /**
    `importRecursive` *`dir`*

    Return a module whose `imports` is a list of all nix file paths in *`dir`*.
    Each nix file contains a module.
    Files whose name starts with underscore (_) is ignored.

    # Inputs

    *`dir`*

    : A dir containing files for nix modules.

    # Type

    ```
    importRecursive :: Path -> {imports :: [Path]}
    ```

    # Examples

    ```nix
    nix-repl> importRecursive ./modules
    {
      imports = [
        /path/to/this/dir/modules/module0.nix
        /path/to/this/dir/modules/module1.nix
      ];
    }
    ```
  */
  importRecursive =
    dir:
    lib.pipe dir [
      lib.filesystem.listFilesRecursive
      (filterWithString isNixFile)
      (filterWithString (file: !isIgnored file))
    ];
in
{
  imports = importRecursive dir;
}
