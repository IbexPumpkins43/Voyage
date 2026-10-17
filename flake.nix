{
  description = "";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          dotnetCorePackages.sdk_8_0
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
          libGL
          libglvnd
          libX11
          libXcursor
          libXext
          libXi
          libXinerama
          libXrandr
          libxcb
        ]);
      };
    };
}
