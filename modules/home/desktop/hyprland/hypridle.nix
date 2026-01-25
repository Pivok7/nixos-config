{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modHome.desktop.hypridle;

  timePrintMin = val: ''${if val > 60 then (toString (val / 60)) + "mins" else ""}'';
  timePrintSec = val: ''${if lib.mod val 60 > 0 then (toString (lib.mod val 60)) + "secs" else ""}'';
  timePrint = val: "${timePrintMin val} ${timePrintSec val}";


  hypridleConfig = ''
    general {
        lock_cmd = pidof hyprlock || hyprlock
        before_sleep_cmd = loginctl lock-session
    }

    listener {
        timeout = ${toString cfg.timeout.lock} # ${timePrint cfg.timeout.lock}
        on-timeout = loginctl lock-session
    }

    listener {
        timeout = ${toString cfg.timeout.disableScreen} # ${timePrint cfg.timeout.disableScreen}
        on-timeout = hyprctl dispatch dpms off
        on-resume = hyprctl dispatch dpms on
    }

    listener {
        timeout = ${toString cfg.timeout.suspend} # ${timePrint cfg.timeout.suspend}
        on-timeout = systemctl suspend
    }
  '';
in
{
  options.modHome.desktop.hypridle = {
    enable = lib.mkEnableOption "Setup hypridle";
    timeout = {
      lock = lib.mkOption {
        type = lib.types.int;
        default = 600;
        description = "Set lock timeout in seconds";
      };
      disableScreen = lib.mkOption {
        type = lib.types.int;
        default = 900;
        description = "Set disable screen timeout in seconds";
      };
      suspend = lib.mkOption {
        type = lib.types.int;
        default = 1200;
        description = "Set suspend timeout in seconds";
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    assertions = [
      {
        assertion = (cfg.timeout.lock > 0 && cfg.timeout.disableScreen > 0 && cfg.timeout.suspend > 0);
        message = "hypridle timeout must be greater than 0";
      }
    ];

    home.packages = [
      pkgs.hypridle
    ];

    home.file.".config/hypr/hypridle.conf".text = lib.trim hypridleConfig;
  };
}
