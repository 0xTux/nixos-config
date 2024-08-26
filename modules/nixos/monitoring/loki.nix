{lib, ...}: {
  services = {
    loki = {
      enable = true;
      configuration = {
        auth_enabled = false;
        server = {
          http_listen_port = 3100;
        };
        common = {
          ring = {
            instance_addr = "127.0.0.1";
            kvstore = {
              store = "inmemory";
            };
          };
          replication_factor = 1;
          path_prefix = "/tmp/loki";
        };
        schema_config = {
          configs = [
            {
              from = "2020-05-15";
              store = "tsdb";
              object_store = "filesystem";
              schema = "v13";
              index = {
                prefix = "index_";
                period = "24h";
              };
            }
          ];
        };
        storage_config = {
          filesystem = {
            directory = "/tmp/loki/chunks";
          };
        };
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "loki.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
          locations = {
            "/" = {
              proxyPass = "http://localhost:3100";
              extraConfig = ''
                proxy_http_version 1.1;
                proxy_read_timeout 1800s;
                proxy_connect_timeout 1600s;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $connection_upgrade;
                proxy_set_header Connection "Keep-Alive";
                proxy_set_header Proxy-Connection "Keep-Alive";
                proxy_redirect off;
              '';
            };

            "/ready" = {
              proxyPass = "http://localhost:3100";
              extraConfig = ''
                proxy_http_version 1.1;
                proxy_set_header Connection "Keep-Alive";
                proxy_set_header Proxy-Connection "Keep-Alive";
                proxy_redirect off;
              '';
            };
          };
        };
      };
    };
  };
}
