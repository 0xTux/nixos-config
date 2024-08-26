{lib, ...}: {
  services = {
    gitea = {
      enable = true;
      settings = {
        service.DISABLE_REGISTRATION = true;
        server = {
          DOMAIN = "git.tux.rs";
          ROOT_URL = "https://git.tux.rs";
        };
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "git.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
          locations = {
            "/" = {
              proxyPass = "http://localhost:3000";
            };
          };
        };
      };
    };
  };
}
