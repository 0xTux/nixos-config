{ ... }:

{
  hardware = {
    nvidia.prime.offload.enable = true;
    opengl.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
