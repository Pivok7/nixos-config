{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.desktop.hyprlock;

  hyprlockConfig = ''
    general {
        hide_cursor = ${if cfg.hideCursor then "true" else "false"}
    }

    #Background
    background {
        monitor =
        blur_passes = 3
    }

    #Password Input
    input-field {
        size = 250, 50
        dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
        placeholder_text = <i>Password...</i>

        position = 0, 200
        halign = center
        valign = bottom
    }

    #Date
    label {
        monitor =
        text = cmd[update:18000000] echo "<b> "$(date +'%A, %-d %B %Y')" </b>"
        font_size = 40
        font_family = ${cfg.font} 

        position = 0, -150
        halign = center
        valign = top
    }

    #Time
    label {
        monitor =
        text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>" # 24H
        font_size = 110
        font_family = ${cfg.font} 

        position = 0, 0
        halign = center
        valign = center
    }

    #User
    label {
        monitor =
        text =    $USER
        font_size = 26
        font_family = ${cfg.font}

        position = 0, 100
        halign = center
        valign = bottom
    }
  '';
in
{
  options.modHome.desktop.hyprlock = {
    enable = lib.mkEnableOption "Setup hyprpaper";
    font = lib.mkOption {
      type = lib.types.str;
      default = "Iosevka Semibold Extended";
      description = "Set font";
    };
    hideCursor = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Hide cursor when locked";
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      pkgs.hyprlock
    ];

    home.file.".config/hypr/hyprlock.conf".text = lib.trim hyprlockConfig;
  };
}
