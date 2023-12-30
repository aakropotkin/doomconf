# -*- mode: snippet -*-
# group: file templates
# contributor: Alex Ameen
# --
# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{

# ---------------------------------------------------------------------------- #

  outputs = { nixpkgs, ... }: let

# ---------------------------------------------------------------------------- #

    projectName = "`(file-name-nondirectory (file-name-directory buffer-file-name))`";

# ---------------------------------------------------------------------------- #

    eachSupportedSystemMap = f: let
      supportedSystems = [
        "x86_64-linux"  "aarch64-linux"  "i686-linux"
        "x86_64-darwin" "aarch64-darwin"
      ];
      proc = system: { name = system; value = f system; };
    in builtins.listToAttrs ( map proc supportedSystems );


# ---------------------------------------------------------------------------- #

    overlays.default = overlays.\${projectName};
    overlays.\${projectName} = final: prev: {
      \${projectName} = prev.emptyFile;
    };


# ---------------------------------------------------------------------------- #

    legacyPackages = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.\${system}.extend overlays.default;
    in {
      \${projectName} = pkgsFor.\${projectName};
    } );


# ---------------------------------------------------------------------------- #

    packages = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.\${system}.extend overlays.default;
    in {
      default         = pkgsFor.\${projectName};
      \${projectName} = pkgsFor.\${projectName};
    } );


# ---------------------------------------------------------------------------- #

    devShells = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.\${system}.extend overlays.default;
      default = pkgsFor.mkShell {
        inputsFrom = [pkgsFor.\${projectName}];
        packages   = [];
        shellHook  = ''
          echo 'Happy Hacking!' >&2;
        '';
      };
    in {
      inherit default;
      \${projectName} = default;
    } );


# ---------------------------------------------------------------------------- #

  in {  # Begin `outputs'

    inherit overlays legacyPackages packages devShells;

    nixosModules = { config.nixpkgs.overlays = overlays.default; };

  };  # End `outputs'


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
