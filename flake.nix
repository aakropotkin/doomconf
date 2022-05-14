{
  description = "Emacs Nix expressions";

  inputs = {
    utils.url = github:numtide/flake-utils;
    utils.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = { self, nixpkgs, utils, home-manager }:
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

