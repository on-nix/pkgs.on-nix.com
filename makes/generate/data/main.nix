{ __nixpkgs__
, attrsMapToList
, inputs
, makeTemplate
, makeScript
, toBashMap
, ...
}:
let
  attrsPath = "${inputs.pkgs}/data/nixpkgs/attrs.json";
  attrs =
    if inputs.prod
    then builtins.fromJSON (builtins.readFile attrsPath)
    else [ "nix" ];
in
makeScript {
  name = "generate-data";
  entrypoint = ./entrypoint.sh;
  replace = {
    __argData__ = __nixpkgs__.linkFarm "data" (builtins.concatLists [
      (builtins.map
        (attr: {
          name = "nixpkgs/${attr}.json";
          path = "${inputs.pkgs}/data/nixpkgs/attrs/${attr}.json";
        })
        attrs)
    ]);
  };
}
