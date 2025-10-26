{ ... }:
{
  imports = [
    ./neovim.nix
    ./kitty.nix
    ./yazi.nix
    ./nushell.nix

    ./lsp.nix
    ./fmt.nix

    ./bundles/root.nix
    ./bundles/favourite.nix
  ];
}
