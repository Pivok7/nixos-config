{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.dev.bundle.csharp;
in
{
  options.modHome.dev.bundle.csharp = {
    enable = lib.mkEnableOption "C# bundle";
  };

  config = lib.mkIf (cfg.enable) {
    modHome.dev.lsp.csharp.enable = true;
    modHome.dev.fmt.csharp.enable = true;
    home.packages = with pkgs; [
      dotnet-sdk_10
      dotnet-runtime_10
      dotnet-aspnetcore_10
    ];
  };
}
