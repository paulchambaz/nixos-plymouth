{
  pkgs ? import <nixpkgs> {},
}:
pkgs.stdenv.mkDerivation rec {
  pname = "nixos-boot";
  version = "0.1.0";

  src = ./src;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/nixos-load
    cd nixos-load
    cp *png nixos-load.script nixos-load.plymouth $out/share/plymouth/themes/nixos-load
    chmod +x $out/share/plymouth/themes/nixos-load/nixos-load.plymouth $out/share/plymouth/themes/nixos-load/nixos-load.script
    sed -i "s@/usr/@$out/@" $out/share/plymouth/themes/nixos-load/nixos-load.plymouth
  '';
}
