{lib, ...}: {
  services = {
    promtail = {
      enable = true;
      configuration = {
        server = {
          http_listen_port = 9080;
          grpc_listen_port = 0;
        };
        positions = {
          filename = "/var/lib/promtail/positions.yaml";
        };
        clients = [
          {
            url = "https://loki.tux.rs/loki/api/v1/push";
          }
        ];
        scrape_configs = [
          {
            job_name = "journal";
            journal = {
              max_age = "12h";
              labels = {
                job = "systemd-journal";
              };
            };
            relabel_configs = [
              {
                source_labels = [
                  "__journal__systemd_unit"
                ];
                target_label = "unit";
              }
            ];
          }
        ];
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "promtail.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
          locations = {
            "/" = {
              proxyPass = "http://localhost:9080";
            };
          };
        };
      };
    };
  };
}
