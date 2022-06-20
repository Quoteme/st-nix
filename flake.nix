{
  description = "Luca's Suckless Terminal build using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        defaultApp = apps.st-nix;
        defaultPackage = packages.st-nix;

        apps.st-nix = {
          type = "app";
          program = "${defaultPackage}/bin/st";
        };

        packages.st-nix = pkgs.stdenv.mkDerivation rec {
          version = "0.8.4";
          pname = "st-nix";
          src = ./.;
          nativeBuildInputs = with pkgs; [
            pkg-config
            ncurses
            fontconfig
            freetype
          ];
          buildInputs = with pkgs; [
            xorg.libX11
            xorg.libXft
            harfbuzz # for ligature support
            noto-fonts-emoji
            scientifica
            fira-code
            hasklig
          ];
          TERMINFO=".";
          makeFlags = [
            "DESTDIR=$(out)"
            "PREFIX="
          ];
        };
      }
    );
}
