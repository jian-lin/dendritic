flakeArgs:

{
  my.modules.homeManager.appLauncher =
    { config, ... }:
    {
      options.my.appLauncher = flakeArgs.config.my.lib.mkNoDefaultPackageOption "app launcher" "wofi";

      config = {
        my.appLauncher = config.programs.wofi.package;
        programs.wofi = {
          enable = true;
        };
      };
    };
}
