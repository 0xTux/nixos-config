{lib, ...}: {
  services = {
    vaultwarden = {
      enable = true;
      config = {
        domain = "https://bw.tux.rs";
        enableWebsocket = true;
        signupsAllowed = true;
        disableIconDownload = true;
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "bw.tux.rs" = {
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
