let
   emacsOverlay = (import (builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      ref = "master";
      rev = "bfc8f6edcb7bcf3cf24e4a7199b3f6fed96aaecf"; # change the revision
    }));
   pkgs = import <nixpkgs> {overlays = [emacsOverlay] ;};
in with pkgs;
mkShell {
  buildInputs = [
    pkgs.emacs
    (agda.withPackages (ps: [
      ps.standard-library
      ps.cubical
    ]))
  ];
}