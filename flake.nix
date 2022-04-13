{
  description = "Sequence hentai tag classifier";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-21.11";

  outputs = { self, nixpkgs, ... }: {
    devShell = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.unix (system:
      import ./shell.nix { pkgs = import nixpkgs { inherit system; }; }
    );
  };
}
