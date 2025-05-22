flakeArgs:

{
  my.modules.homeManager.bar =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      options.my.bar = flakeArgs.config.my.lib.mkNoDefaultPackageOption "bar" "ashell";

      config = {
        my.bar = pkgs.ashell;
        home.packages = [ pkgs.ashell ];
        xdg.configFile."ashell/config.toml".text = ''
          log_level = "warn"
          outputs = "active"
          position = "Top"

          [workspaces]
          visibility_mode = "MonitorSpecific"

          [keyboard_layout.labels]
          "English (US)" = "🇺🇸"

          [system]
          indicators = [ "Cpu", "Memory", "Temperature", "DownloadSpeed", "UploadSpeed" ]

          [clock]
          # clock format see: https://docs.rs/chrono/latest/chrono/format/strftime/index.html
          format = "%a %d %b %R"

          [settings]
          lock_cmd = "${lib.getExe config.my.screenLock} &"

          [appearance]
          style = "Islands"
          opacity = 0.7
          background_color = "#1e1e2e"
          primary_color = "#fab387"
          secondary_color = "#11111b"
          success_color = "#a6e3a1"
          danger_color = "#f38ba8"
          text_color = "#f38ba8"
          workspace_colors = [ "#fab387", "#b4befe" ]
          special_workspace_colors = [ "#a6e3a1", "#f38ba8" ]

          [appearance.menu]
          opacity = 0.7
          backdrop = 0.3
        '';
      };

    };
}
