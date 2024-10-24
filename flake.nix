{
  description = "Development Environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    self,
  }: let
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
      pkgs = import nixpkgs { inherit system; config = { allowUnfree = true; }; };
    });
  in {

    devShells = forAllSystems ({ pkgs }: {
      python = import ./modules/python { inherit pkgs; };

      cpp = import ./modules/cpp { inherit pkgs; };

      opengl = import ./modules/opengl { inherit pkgs; };

      vulkan = import ./modules/vulkan { inherit pkgs; };

      gtk = import ./modules/gtk { inherit pkgs; };

      fabric = import ./modules/fabric { inherit pkgs; };

      qt = import ./modules/qt { inherit pkgs; };

      tauri = import ./modules/tauri { inherit pkgs; };
    });
  };
}
