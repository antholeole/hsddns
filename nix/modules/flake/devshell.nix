
{
  perSystem = { config, pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      name = "hsddns";
      meta.description = "Haskell development environment";

      inputsFrom = [
        config.haskellProjects.default.outputs.devShell
        config.pre-commit.devShell
      ];

      packages = with pkgs; [
        just
        nixd
        ghciwatch
      ];
    };
  };
}
