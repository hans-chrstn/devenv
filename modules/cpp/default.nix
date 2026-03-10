{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    pkg-config
    gdb
  ];
  nativeBuildInputs = with pkgs; [
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
    clang-tools_19
  ];
}
