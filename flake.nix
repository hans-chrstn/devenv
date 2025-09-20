{
  description = "Development Environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    rust-overlay,
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
      pkgs = let
        overlays = [ (import rust-overlay) ];
      in
        import nixpkgs { inherit system overlays; config = { allowUnfree = true; }; };
    });
  in {

    devShells = forAllSystems ({ pkgs }: {
      python = import ./modules/python {inherit pkgs;};
      qt = import ./modules/python/qt {inherit pkgs;};

      cpp = import ./modules/cpp {inherit pkgs;};
      sdl = import ./modules/cpp/sdl {inherit pkgs;};
      opengl = import ./modules/cpp/opengl {inherit pkgs;};
      vulkan = import ./modules/cpp/vulkan {inherit pkgs;};
      gtk = import ./modules/cpp/gtk {inherit pkgs;};
      llama = import ./modules/cpp/llama {inherit pkgs;};

      java = import ./modules/java {inherit pkgs;};
      fabric = import ./modules/java/fabric {inherit pkgs;};

      rust = import ./modules/rust {inherit pkgs;};
      tauri = import ./modules/web/tauri {inherit pkgs;};
      bevy = import ./modules/rust/bevy {inherit pkgs;};
      vulkano = import ./modules/rust/vulkano {inherit pkgs;};
      rust-gtk = import ./modules/rust/gtk {inherit pkgs;};

      godot = import ./modules/godot {inherit pkgs;};
      godot-csharp = import ./modules/godot/csharp {inherit pkgs;};

      unity = import ./modules/unity {inherit pkgs;};
    });
  };
}
