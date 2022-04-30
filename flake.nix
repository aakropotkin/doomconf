{
  description = "Emacs Nix expressions";

  inputs.utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, utils }:
  let systemMap = utils.lib.eachSystemMap utils.lib.defaultSystems;
  in {
    packages = systemMap ( system:
      let pkgsFor = import nixpkgs { inherit system; };
      in rec {
        emacs-client-wrapper = pkgsFor.callPackage ./default.nix {};
        default = emacs-client-wrapper;
      }
    );
    defaultPackages = systemMap ( system: self.packages.${system}.default );
  };
}

