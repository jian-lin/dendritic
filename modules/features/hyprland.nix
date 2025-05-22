{
  my.modules.nixos.hyprland = {
    programs = {
      hyprland = {
        enable = true;
        withUWSM = true;
      };
    };
    services.xserver.displayManager.gdm.enable = true;
  };

  my.modules.homeManager.hyprland =
    {
      osConfig,
      lib,
      config,
      ...
    }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        package = lib.mkIf osConfig.programs.hyprland.enable null;
        portalPackage = lib.mkIf osConfig.programs.hyprland.enable null;
        systemd.enable = !(osConfig.programs.hyprland.enable && osConfig.programs.hyprland.withUWSM);
        # https://wiki.hyprland.org/0.49.0/Configuring/
        settings = {
          "$mainMod" = "SUPER";
          bind = [
            "$mainMod, Q, exec, ${lib.getExe config.my.terminalEmulator}"
            "$mainMod, E, exec, ${lib.getExe config.my.fileManager}"
            "$mainMod, R, exec, ${lib.getExe config.my.appLauncher} --show drun"
            "$mainMod, L, exec, ${lib.getExe config.my.screenLock}"
            "$mainMod, C, killactive,"
            "$mainMod, V, togglefloating,"
            "$mainMod, M, exit,"
          ];
          # https://wiki.hyprland.org/0.49.0/Configuring/Monitors/
          # get names using "hyprctl monitors all"
          monitor = [
            # "FIXME NAME,preferred,left,2" # one display
            # "FIXME NAME,preferred,right,2,transform,1" # another display
          ];
          exec-once = [
            (lib.getExe config.my.bar) # better to use systemd
          ];
          ecosystem = {
            "no_update_news" = true;
          };
        };
      };
    };
}
