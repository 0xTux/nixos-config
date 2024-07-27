{lib, ...}: {
  services = {
    vaultwarden = {
      enable = true;
      config = {
        domain = "https://vault.0xtux.com";
        enableWebsocket = true;
        signupsAllowed = true;
        disableIconDownload = true;
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "vault.0xtux.com" = {
          forceSSL = true;
          enableACME = true;
          locations = {
            "/" = {
              proxyPass = "http://localhost:8000";
              proxyWebsockets = true;
            };
          };
        };
      };
    };
  };
}
