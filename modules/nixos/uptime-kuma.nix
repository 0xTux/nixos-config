{lib, ...}: {
  services = {
    uptime-kuma = {
      enable = true;
      settings = {
        DATA_DIR = "/var/lib/uptime-kuma";
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "stats.0xtux.com" = {
          forceSSL = true;
          enableACME = true;
          locations = {
            "/" = {
              proxyPass = "http://localhost:3001";
            };
          };
        };
      };
    };
  };
}
