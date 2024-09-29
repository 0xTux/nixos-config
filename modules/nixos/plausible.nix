{
  config,
  lib,
  ...
}: {
  services = {
    plausible = {
      enable = true;

      server = {
        baseUrl = "https://plausible.tux.rs";
        port = 2100;
        disableRegistration = true;
        secretKeybaseFile = config.sops.secrets.plausible_key.path;
      };

      adminUser = {
        activate = true;
        name = "tux";
        email = "0xtux@pm.me";
        passwordFile = config.sops.secrets.plausible_password.path;
      };

      database.postgres = {
        dbname = "plausible";
        socket = "/run/postgresql";
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "plausible.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
          locations = {
            "/" = {
              proxyPass = "http://localhost:2100";
            };
          };
        };
      };
    };
  };
}
