flakeArgs:

{
  my.modules.homeManager.fileManager =
    {
      config,
      pkgs,
      ...
    }:
    {
      options.my.fileManager = flakeArgs.config.my.lib.mkNoDefaultPackageOption "file manager" "nautilus";

      config = {
        my.fileManager = pkgs.nautilus;
        home.packages = [ config.my.fileManager ];
      };
    };
}
