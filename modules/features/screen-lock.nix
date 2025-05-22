flakeArgs:

{
  my.modules.nixos.screenLock = {
    security.pam.services.hyprlock = { };
  };

  my.modules.homeManager.screenLock =
    { config, ... }:
    {
      options.my.screenLock = flakeArgs.config.my.lib.mkNoDefaultPackageOption "screen lock" "hyprlock";

      config = {
        my.screenLock = config.programs.hyprlock.package;

        programs.hyprlock = {
          enable = true;
          settings = {
            animations = {
              enable = true;
              bezier = "linear, 1, 1, 0, 0";
              animation = [
                "fadeIn, 1, 5, linear"
                "fadeOut, 1, 5, linear"
                "inputFieldDots, 1, 2, linear"
              ];
            };
            background = {
              blur_passes = 3;
            };
          };
        };
      };
    };
}
