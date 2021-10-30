{ inputs
, ...
}:
{
  inputs = {
    prod = true;

    pkgs = builtins.fetchGit {
      ref = "main";
      rev = "1214d83d3677f9c5a755638721e99f784ce53f4c";
      url = "https://github.com/on-nix/pkgs";
    };
  };
}
