let
   sources = import ./nix/sources.nix;
   emacsOverlay = import sources.emacs-overlay;
   pkgs = import sources.nixpkgs {overlays = [emacsOverlay] ;};
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