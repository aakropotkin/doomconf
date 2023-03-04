{
  description = "Emacs Nix expressions";

  inputs.home-manager.url = "github:nix-community/home-manager";

  inputs.home-manager.inputs.nixpkgs.follows = "/nixpkgs";

  outputs = { self, nixpkgs, home-manager }: let
    inherit (builtins) nixVersion compareVersions;
    eachDefaultSystemMap = fn: builtins.foldl' ( acc: system: acc // {
      ${system} = fn system;
    } ) {} [
      "x86_64-linux" "aarch64-linux" "i686-darwin"
      "x86_64-darwin" "aarch64-darwin"
    ];
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

