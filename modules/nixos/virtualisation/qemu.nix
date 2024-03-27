{
  pkgs,
  username,
  ...
}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };

  users.users.${username}.extraGroups = ["libvirtd"];

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
  ];
}
