{
  config,
  pkgs,
  lib,
  ...
}: {
  security = {
    acme = {
      defaults.email = "0xtux@pm.me";
      acceptTerms = true;
    };
  };

  services = {
    headscale = {
      enable = true;
      port = 8080;
      address = "0.0.0.0";
      settings = {
        dns_config = {
          override_local_dns = true;
          base_domain = "tux.rs";
          magic_dns = true;
          nameservers = [
            "9.9.9.9"
          ];
        };
        server_url = "https://hs.tux.rs";
        metrics_listen_addr = "0.0.0.0:8095";
        logtail = {
          enabled = false;
        };
        log = {
          level = "warn";
        };
        ip_prefixes = [
          "100.64.0.0/10"
          "fd7a:115c:a1e0::/48"
        ];
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "hs.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
          locations = {
            "/" = {
              proxyPass = "http://localhost:${toString config.services.headscale.port}";
              proxyWebsockets = true;
            };
            "/metrics" = {
              proxyPass = "http://${config.services.headscale.settings.metrics_listen_addr}/metrics";
            };
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [headscale];
}
