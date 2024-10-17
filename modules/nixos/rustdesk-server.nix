{...}: {
  services = {
    rustdesk-server = {
      enable = true;
      openFirewall = true;
      relayIP = "100.64.0.4";
    };
  };
}
