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

    devShells = forAllSystems ({ pkgs }: 
      let
        cpp = with pkgs; [
          cmake
          clang
          meson
          ninja
          cppcheck
          codespell
          conan
          doxygen
          gtest
          lcov
          vcpkg
          vcpkg-tool
          cargo
          clang-tools_18
        ];
        cpp-libs = with pkgs; [
          gcc
          pkg-config
          gdb
        ];

        shell = ''
          alias yy="yazi"
          echo "Type 'yy' to launch yazi"
        '';

        minecraft-lib = with pkgs; [
          flite.lib
          alsa-lib
          libpulseaudio
          glfw
          openal
          libGL
          glfw-wayland-minecraft
        ];

        mc-modding-tools = with pkgs; [
          jetbrains.idea-community
          aseprite
          blockbench
        ];
      in
    { 
      python = pkgs.mkShell {
        buildInputs = with pkgs; [ python313 ];
        nativeBuildInputs = [];
        shellHook = shell;
      };
      
      cpp = pkgs.mkShell {
        buildInputs = cpp-libs;

        nativeBuildInputs = cpp;
        shellHook = shell;
      };

      opengl = let 
          libs = cpp-libs ++ (with pkgs; [
            libGL
            glfw
            glew
            mesa
            glm
            llvmPackages_latest.libcxx
            llvmPackages_latest.llvm
            llvmPackages_latest.libcxxClang
            llvmPackages_latest.libcxxStdenv
          ]);
        in
        pkgs.mkShell {
          buildInputs = libs;
          nativeBuildInputs = with pkgs; [
            bear
            cmake
            meson
            ninja
            cppcheck
            codespell
            conan
            doxygen
            gtest
            lcov
            vcpkg
            vcpkg-tool
            cargo
            llvmPackages_latest.clang-tools
          ]; 
          shellHook = ''
            ${shell}
          '';
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
      };

      vulkan = pkgs.mkShell {
        buildInputs = cpp-libs ++ (with pkgs; [
          libGL
          SDL2
          SDL2_ttf
          SDL2_mixer
          SDL2_image
          SDL2_sound
          SDL2_gfx
          SDL2_net
          glslang
          mesa
          renderdoc
          spirv-tools
          vulkan-volk
          vulkan-tools
          vulkan-loader
          vulkan-headers
          vulkan-validation-layers
          vulkan-tools-lunarg
          vulkan-extension-layer
        ]);
        nativeBuildInputs = cpp;
        shellHook = shell;
      };
      
      gtk = pkgs.mkShell {
        buildInputs = cpp-libs ++ (with pkgs; [
          gtkmm4
        ]);

        nativeBuildInputs = cpp;
        shellHook = shell;
      };

      fabric = let 
          libs = minecraft-lib ++ (with pkgs; [
            kotlin
            jetbrains.jdk
          ]);
        in 
        pkgs.mkShell {
        buildInputs = libs;
        nativeBuildInputs = mc-modding-tools;
        LD_LIBRARY_PATH = pkgs.lib.strings.makeLibraryPath libs;
        shellHook = ''
          ${shell}
          alias ii="idea-community"
          alias aa="aseprite"
          alias bb="blockbench"
          echo "Type 'ii' to launch Intellij"
          echo "Type 'aa' to launch Aseprite"
          echo "Type 'bb' to launch Blockbench"
        '';
      };

      qt = pkgs.mkShell {
        buildInputs = with pkgs; [
          (python3.withPackages(ps: with ps; [
            pip
            pyside6
          ]))
          qt6.full
       ];

       shellHook = shell;
      };
    });
  };
}
