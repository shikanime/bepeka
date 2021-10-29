{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib, stdenv ? pkgs.stdenv }:

let pythonEnv = pkgs.python38.withPackages (pypkgs: with pypkgs; [ pip ]);
in pkgs.mkShell {
  buildInputs =
    [ pythonEnv pkgs.poetry pkgs.cudatoolkit_11_2 pkgs.cudnn_cudatoolkit_11_2 ];
  shellHook = ''
    export LD_LIBRARY_PATH="${
      lib.concatStringsSep ":" [
        "${pkgs.cudatoolkit_11_2}/lib"
        "${pkgs.cudnn_cudatoolkit_11_2}/lib"
      ]
    }:${
      lib.makeLibraryPath [ stdenv.cc.cc.lib pkgs.cudatoolkit_11_2.lib ]
    }''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH"
  '';
}
