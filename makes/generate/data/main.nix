{ __nixpkgs__
, attrsMapToList
, inputs
, makeTemplate
, makeScript
, toBashMap
, ...
}:
let
  prod = true;

  fromJSONFile = path: builtins.fromJSON (builtins.readFile path);
  toJsonFile = name: data: builtins.toFile name (builtins.toJSON data);

  attrsPath = /data/github/on-nix/pkgs/data/nixpkgs/attrs.json;
  attrs =
    if prod
    then fromJSONFile attrsPath
    else [ "firefox" "nix" ];
in
makeScript {
  name = "generate-data";
  entrypoint = ./entrypoint.sh;
  replace = {
    __argData__ = __nixpkgs__.linkFarm "data" (builtins.concatLists [
      (builtins.map
        (attr: {
          name = "nixpkgs/${attr}.json";
          path = "/data/github/on-nix/pkgs/data/nixpkgs/attrs/${attr}.json";
        })
        attrs)
    ]);
  };
}
