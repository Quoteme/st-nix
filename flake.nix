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
        defaultApp = packages.st-nix;
        defaultPackage = packages.st-nix;

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
          ];
          TERMINFO=".";
          makeFlags = [
            "DESTDIR=$(out)"
            "PREFIX="
          ];
          postInstall = ''
            ln -s $out/bin/st $out/bin/st-nix
          '';
        };
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.pkg-config ];
          buildInputs = with pkgs; [
            clang
            clang-tools
            bear
          ] ++ packages.st-nix.buildInputs;
        };
      }
    );
}
