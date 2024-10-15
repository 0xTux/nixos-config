{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  services = {
    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "cloud.tux.rs" = {
          forceSSL = true;
          useACMEHost = "tux.rs";
        };
      };
    };

    nextcloud = {
      enable = true;
      hostName = "cloud.tux.rs";
      package = pkgs.nextcloud30;
      database.createLocally = true;
      configureRedis = true;
      maxUploadSize = "16G";
      https = true;

      autoUpdateApps.enable = true;
      extraAppsEnable = true;
      extraApps = with config.services.nextcloud.package.packages.apps; {
        inherit mail spreed;
      };

      config = {
        adminuser = "${username}";
        adminpassFile = config.sops.secrets.nextcloud_password.path;
      };

      settings = {
        overwriteProtocol = "https";
        default_phone_region = "IN";
      };
    };
  };

  environment.systemPackages = with pkgs; [nextcloud30];
}
