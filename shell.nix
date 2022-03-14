{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python39.withPackages (ps: with ps; [ poetry ]))
  ];
}
