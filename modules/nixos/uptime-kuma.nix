{lib, ...}: {
  services = {
    uptime-kuma = {
      enable = true;
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "uptime.0xtux.com" = {
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
