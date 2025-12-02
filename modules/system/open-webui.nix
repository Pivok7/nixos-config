{
  config,
  lib,
  ...
}:

let
  cfg = config.modSys.open-webui;
in
{
  options.modSys.open-webui = {
    enable = lib.mkEnableOption "Enable Open WebUI";
    port = lib.mkOption {
      type = lib.types.int;
      default = 8082;
      description = "Set default port";
    };
    ollama-url = lib.mkOption {
      type = lib.types.str;
      default = "http://127.0.0.1:11434";
      description = "Set ollama url";
    };
    webui-auth = lib.mkEnableOption "Enable WebUI auth";
  };

  config = lib.mkIf (cfg.enable) {
    services.open-webui = {
      enable = true;
      port = cfg.port;
      environment = {
        OLLAMA_BASE_URL = cfg.ollama-url;
        WEBUI_AUTH = if cfg.webui-auth then "True" else "False";
      };
    };
  };
}
