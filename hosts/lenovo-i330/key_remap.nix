{ ... }:
{
  services.evremap = {
    enable = true;
    settings = {
      device_name = "AT Translated Set 2 keyboard";
      remap = [
        {
          input = [ "KEY_SLASH" ];
          output = [ "KEY_MACRO30" ];
        }
        {
          input = [ "KEY_KP7" ];
          output = [
            "KEY_LEFTSHIFT"
            "KEY_LEFTBRACE"
          ];
        }
        {
          input = [ "KEY_KP8" ];
          output = [
            "KEY_LEFTSHIFT"
            "KEY_RIGHTBRACE"
          ];
        }
        {
          input = [ "KEY_KP9" ];
          output = [
            "KEY_LEFTSHIFT"
            "KEY_SLASH"
          ];
        }
      ];
    };
  };
}
