{ pkgs ? import <nixpkgs> {} }: with pkgs;
stdenv.mkDerivation rec {
  version = "0.1";
  pname = "default";
  src = ./.;
  buildInputs = [
  ];
  # buildPhase = "ghc --make xmonadctl.hs";
  # installPhase = ''
  #   mkdir -p $out/bin
  #   cp xmonadctl $out/bin/
  #   chmod +x $out/bin/xmonadctl
  # '';
}
