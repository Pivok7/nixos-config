{ ... }:
{
  imports = [
    ./neovim.nix
    ./lsp.nix
    ./fmt.nix
    ./bundles/root.nix
    ./bundles/favourite.nix
  ];
}
