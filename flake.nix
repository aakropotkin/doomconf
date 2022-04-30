{
  description = "Emacs Nix expressions";

  inputs.utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, utils }:
  let systemMap = utils.lib.eachSystemMap utils.lib.defaultSystems;
  in {
    packages = systemMap ( system:
      let pkgsFor = import nixpkgs { inherit system; };
      in rec {
        my-emacs = pkgsFor.callPackage ./default.nix {};
        default = my-emacs;
      }
    );
    defaultPackages = systemMap ( system: self.packages.${system}.default );
  };
}

