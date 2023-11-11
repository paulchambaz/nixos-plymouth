# Nixos load plymouth theme

This is a very simple plymouth theme for nixos containing a static image of the nixos logo.

## Install

To install it, you would add this to your nixos configuration file :

```nix
let
  nixos-load-src = pkgs.fetchFromGitHub {
    owner = "paulchambaz";
    repo = "nixos-load";
    rev = "main";
    sha256 = "";
  };
  nixos-load = pkgs.callPackage nixos-load-src {};
in
{
  boot.plymouth = {
    enable = true;
    themePackages = [ nixos-load ];
    theme = "nixos-load";
  };
}
```
