flakeArgs:

{
  my.modules.homeManager.terminalEmulator =
    { config, ... }:
    {
      options.my.terminalEmulator = flakeArgs.config.my.lib.mkNoDefaultPackageOption "terminal emulator" "kitty";

      config = {
        my.terminalEmulator = config.programs.kitty.package;
        programs.kitty = {
          enable = true;
        };
      };
    };
}
