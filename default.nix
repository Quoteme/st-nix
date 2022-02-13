{ pkgs ? import <nixpkgs> {} }: with pkgs;
stdenv.mkDerivation rec {
  version = "0.8.4";
  pname = "st-nix";
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
  # dontBuild = true;
  # buildPhase = "ghc --make xmonadctl.hs";
  # installPhase = ''
  #   mkdir -p $out/bin
  #   cp xmonadctl $out/bin/
  #   chmod +x $out/bin/xmonadctl
  # '';
}
