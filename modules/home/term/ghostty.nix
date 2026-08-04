{
  config,
  lib,
  pkgs-unstable,
  ...
}:

let
  cfg = config.modHome.term.ghostty;

  ghosttyConfig = ''
    font-family = ${cfg.font.name}
    font-size = ${toString cfg.font.size} 

    command = ${cfg.shell}
    confirm-close-surface = false
    mouse-scroll-multiplier = 1

    theme = Ayu
    background-opacity = ${toString cfg.opacity} 

    gtk-wide-tabs = false
    window-decoration = server
    ${if cfg.gtkStyle then "gtk-custom-css = ./style.css" else ""}
  '';

  ghosttyGtkStyle = ''
    titlebar {
      margin: 0;
      padding: 0;
    }

    tabbar tabbox {
        margin: 0;
        padding: 0;
    }

    tabbar tabbox tab label {
        font-family: ${cfg.font.name};
        font-size: ${toString cfg.font.size};
    }
  '';
in
{
  options.modHome.term.ghostty = {
    enable = lib.mkEnableOption "Setup ghostty";
    font = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "Iosevka";
        description = "Set font family";
      };
      size = lib.mkOption {
        type = lib.types.int;
        default = 18;
        description = "Set font size";
      };
    };
    shell = lib.mkOption {
      type = lib.types.str;
      default = "nu";
      description = "Set default shell";
    };
    opacity = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Set opacity value";
    };
    gtkStyle = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable gtk style";
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs-unstable.ghostty
    ];

    home.file.".config/ghostty/config.ghostty" = {
      text = lib.trim ghosttyConfig;
    };
    home.file.".config/ghostty/style.css" = {
      text = lib.trim ghosttyGtkStyle;
    };
  };
}
