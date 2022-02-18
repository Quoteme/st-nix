{
  description = "A version of simple terminal leveraging the power of the nix ecosystem";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-compat = {
      url = github:edolstra/flake-compat;
      flake = false;
    };
  };

  outputs = {self, nixpkgs, flake-compat}: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    defaultPackage.x86_64-linux = pkgs.stdenv.mkDerivation rec {
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
      postInstall = ''
        cp $out/bin/st $out/bin/st-nix
      '';
    };
  };
}
