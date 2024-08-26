{
  lib,
  username,
  ...
}: {
  services = {
    grafana = {
      enable = true;
      settings = {
        server.http_port = 8888;
        security = {
          admin_user = "${username}";
          admin_email = "0xtux@pm.me";
        };
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "grafana.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
          locations = {
            "/" = {
              proxyPass = "http://localhost:8888";
              extraConfig = ''
                proxy_set_header Host $host;
              '';
            };

            "/api/live/" = {
              proxyPass = "http://localhost:8888";
              extraConfig = ''
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $connection_upgrade;
                proxy_set_header Host $host;
              '';
            };
          };
        };
      };
    };
  };
}
