{pkgs}: let
  cpp = import ../default.nix {inherit pkgs;};
in
  pkgs.mkShell.override rec {stdenv = pkgs.clangStdenv;} {
    buildInputs =
      cpp.buildInputs
      ++ (with pkgs; [
        libGL
        glew
        mesa
        glfw-wayland
        glm
      ]);
    nativeBuildInputs = cpp.nativeBuildInputs ++ (with pkgs; []);
    LD_LIBRARY_PATH = "${pkgs.glfw-wayland}/lib:${pkgs.libGL}/lib";
    shellHook = ''
      ${cpp.shellHoook}
    '';
  }
