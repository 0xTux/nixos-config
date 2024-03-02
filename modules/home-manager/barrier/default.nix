{pkgs, ...}: {
  # services.barrier.client.enable = true;

  home.packages = with pkgs; [
    barrier
  ];
}
