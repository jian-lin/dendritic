{ config, ... }:

{
  my.modules.nixos.profileHyprland.imports = builtins.attrValues {
    inherit (config.my.modules.nixos)
      hyprland
      ;
  };

  my.modules.homeManager.profileHyprland.imports = builtins.attrValues {
    inherit (config.my.modules.homeManager)
      hyprland
      fileManager
      terminalEmulator
      notificationDaemon
      authenticationAgent
      appLauncher
      screenLock
      bar
      ;
  };
}
