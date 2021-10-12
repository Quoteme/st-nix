{ pkgs ? import <nixpkgs> {} }: with pkgs;
stdenv.mkDerivation rec {
  version = "0.1";
  pname = "default";
  src = ./.;
  nativeBuildInputs = [
    pkg-config
    ncurses
    fontconfig
    freetype
  ];
  buildInputs = [
    xorg.libX11
    xorg.libXft
  ];
  TERMINFO=".";
  makeFlags = [
    "DESTDIR=$(out)"
    "PREFIX="
  ];
  # dontBuild = true;
  # buildPhase = "ghc --make xmonadctl.hs";
  # installPhase = ''
  #   mkdir -p $out/bin
  #   cp xmonadctl $out/bin/
  #   chmod +x $out/bin/xmonadctl
  # '';
}
