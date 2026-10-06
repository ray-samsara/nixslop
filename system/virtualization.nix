{
  ...
}:

{
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
}