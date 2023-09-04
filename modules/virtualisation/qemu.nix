{ pkgs, username, ... }:

{
  virtualisation = {
    libvirtd.enable = true;
  };

  users.users.${username}.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
