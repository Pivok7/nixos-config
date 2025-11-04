{ ... }:
{
  imports = [
    ./neovim.nix
    ./terminal.nix
    ./versioning.nix
    ./yazi.nix
    ./shell.nix

    ./lsp.nix
    ./fmt.nix

    ./bundles/default.nix
    ./bundles/favourite.nix
  ];
}
