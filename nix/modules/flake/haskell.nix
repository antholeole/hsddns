{
  root,
  inputs,
  ...
}: {
  imports = [
    inputs.haskell-flake.flakeModule
  ];
  perSystem = {
    self',
    lib,
    ...
  }: {
    haskellProjects.default = {
      projectRoot = builtins.toString (lib.fileset.toSource {
        inherit root;
        fileset = lib.fileset.unions [
          (root + /src)
          (root + /hsddns.cabal)
          (root + /LICENSE)
          (root + /README.md)
        ];
      });

      packages = {
        # Add source or Hackage overrides here
        # (Local packages are added automatically)
        /*
        aeson.source = "1.5.0.0" # Hackage version
        shower.source = inputs.shower; # Flake input
        */
      };

      settings = {
        hsddns = {
          stan = true;
        };
      };

      autoWire = ["packages" "apps" "checks"];
    };

    packages.default = self'.packages.hsddns;
    apps.default = self'.apps.hsddns;
  };
}
