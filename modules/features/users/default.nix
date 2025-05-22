{
  my.modules.nixos.users = {
    users = {
      mutableUsers = false;
      # FIXME password is 123, change it!
      users.root.hashedPassword = "$2b$05$dZFh0xjyZI2kxaIkNdQXAOViFuM3gM4rqXFgzBwFrBB/FvEE58JMG";
    };
  };
}
