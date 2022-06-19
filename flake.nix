{
  description = "Emacs Nix expressions";

  inputs.utils.url        = "github:numtide/flake-utils/master";
  inputs.home-manager.url = "github:nix-community/home-manager";

  inputs.utils.inputs.nixpkgs.follows        = "/nixpkgs";
  inputs.home-manager.inputs.nixpkgs.follows = "/nixpkgs";

  outputs = { self, nixpkgs, utils, home-manager }: let
    inherit (utils.lib) eachDefaultSystemMap;
    inherit (builtins) nixVersion compareVersions;
    legacyDefault =
      if ( 0 < ( compareVersions nixVersion "2.6" ) ) then {} else {
        defaultPackages =
          eachDefaultSystemMap ( system: self.packages.${system}.default );
      };
  in {
    packages = eachDefaultSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.${system};
    in {
      emacs-client-wrapper = pkgsFor.callPackage ./default.nix {};
      default = self.packages.${system}.emacs-client-wrapper;
    } );
  } // legacyDefault;
}

