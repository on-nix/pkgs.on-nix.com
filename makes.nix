{ inputs
, ...
}:
{
  inputs = {
    prod = true;

    pkgs = builtins.fetchGit {
      ref = "main";
      rev = "60c2334b35424f02d3a970cc049ebe5d45b00fe9";
      url = "https://github.com/on-nix/pkgs";
    };
  };
}
