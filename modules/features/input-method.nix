{
  my.modules.nixos.inputMethod =
    { pkgs, ... }:
    {
      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          addons = [
            pkgs.fcitx5-rime
            pkgs.fcitx5-chinese-addons
          ];
          # waylandFrontend = true;
        };
      };
    };

  my.modules.homeManager.inputMethod =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fcitx5-configtool ];
    };
}
