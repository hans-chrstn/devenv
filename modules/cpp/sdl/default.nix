{pkgs}: let
  cpp = import ../default.nix {inherit pkgs;};
in
  pkgs.mkShell.override rec {stdenv = pkgs.clangStdenv;} {
    buildInputs =
      cpp.buildInputs
      ++ (with pkgs; [
        SDL2
        SDL2_image
        SDL2_mixer
        SDL2_ttf
        SDL2_sound
        SDL2_gfx
        SDL2_net
        SDL2_Pango
      ]);
    nativeBuildInputs =
      cpp.nativeBuildInputs
      ++ (with pkgs; [
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
        pkg-config
      ]);
  }
