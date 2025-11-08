{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHomeTui.kitty;

  kittyConfig = ''
    # Font
    font_family ${cfg.font.name}
    font_size ${toString cfg.font.size}

    #Shell
    shell ${cfg.shell}

    #Maps
    map ctrl+shift+t launch --cwd=current --type=tab
    map ctrl+shift+d detach_tab

    #Tabs
    tab_bar_edge top
    tab_bar_style powerline

    #Cursor
    cursor ${cfg.cursor.color}
    cursor_trail ${if cfg.cursor.trail.enable then "1" else "0"}

    #Appearance
    term xterm-256color
    background_opacity ${toString cfg.opacity}

    #Options
    confirm_os_window_close 0
  '';
in
{
  options.modHomeTui.kitty = {
    enable = lib.mkEnableOption "Setup kitty";
    font = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "Iosevka";
        description = "Set font family";
      };
      size = lib.mkOption {
        type = lib.types.float;
        default = 18.0;
        description = "Set font size";
      };
    };
    shell = lib.mkOption {
      type = lib.types.str;
      default = "nu";
      description = "Set default shell";
    };
    cursor = {
      color = lib.mkOption {
        type = lib.types.str;
        default = "#8fee96";
        description = "Set cursor color";
      };
      trail = {
	  enable = lib.mkOption {
	    type = lib.types.bool;
	    default = true;
	    description = "Enable cursor trail animation";
	  };
      };
    };
    opacity = lib.mkOption {
      type = lib.types.float;
      default = 0.90;
      description = "Set opacity value";
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.kitty
    ];

    home.file.".config/kitty/kitty.conf".text = lib.trim kittyConfig;
  };
}
