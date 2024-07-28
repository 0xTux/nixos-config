{lib, ...}: {
  services = {
    gitea = {
      enable = true;
      settings = {
        service.DISABLE_REGISTRATION = true;
        server.DOMAIN = "git.0xtux.com";
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "git.0xtux.com" = {
          forceSSL = true;
          enableACME = true;
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
