{ ... }:
{
  imports = [
    ./lsp.nix
    ./fmt.nix

    ./bundles/default.nix
    ./bundles/favourite.nix
  ];
}
