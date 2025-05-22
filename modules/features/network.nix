{
  my.modules.nixos.network = {
    networking = {
      networkmanager.enable = true;
      firewall.enable = false;
      # proxy.default = "http://FIXME";
    };
  };
}
