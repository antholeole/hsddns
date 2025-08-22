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
        bluefin.source = "0.0.15.0";
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
