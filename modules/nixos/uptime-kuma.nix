{lib, ...}: {
  services = {
    uptime-kuma = {
      enable = true;
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "uptime.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
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
