{lib, ...}: {
  services = {
    ntfy-sh = {
      enable = true;
      settings = {
        listen-http = ":7070";
        base-url = "https://ntfy.tux.rs";
        behind-proxy = true;
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "ntfy.tux.rs" = {
          forceSSL = true;
          enableACME = true;
          locations = {
            "/" = {
              proxyPass = "http://localhost:7070";
              proxyWebsockets = true;
            };
          };
        };
      };
    };
  };
}
