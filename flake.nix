{
  description = "Proton Pass Desktop - password manager desktop application";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      packages.${system} = {
        default = pkgs.callPackage ./package.nix {};
        proton-pass = self.packages.${system}.default;
      };

      overlays.default = final: prev: {
        proton-pass = final.callPackage ./package.nix {};
      };
    };
}
