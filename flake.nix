{
  description = "A version of simple terminal leveraging the power of the nix ecosystem";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = github:edolstra/flake-compat;
      flake = false;
    };
  };

  outputs = {self, nixpkgs, flake-compat, flake-utils}: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
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
            scientifica
            fira-code
            hasklig
          ];
          TERMINFO=".";
          makeFlags = [
            "DESTDIR=$(out)"
            "PREFIX="
          ];
          # This causes an error: 'builtins.storePath' is not allowed in pure evaluation mode
          # postInstall = ''
          #   cp $out/bin/st $out/bin/st-nix
          # '';
        };
        defaultPackage = packages.st-nix;
        defaultApp = {
          type = "app";
          program = "${defaultPackage}/bin/st";
        };
      }
    );
}
