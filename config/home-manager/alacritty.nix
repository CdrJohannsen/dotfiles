{
  general = {
    live_config_reload = true;
  };

  colors = {
    draw_bold_text_with_bright_colors = false;

    normal = {
      black = "0xc5c8b0";
      blue = "0xd05f2f";
      cyan = "0xaf7f3f";
      green = "0xa0af64";
      magenta = "0xa93988";
      red = "0xc82815";
      white = "0x4d4d4c";
      yellow = "0xeab700";
    };

    primary = {
      background = "#1d150c";
      foreground = "#c5c8b0";
    };
  };

  cursor = {
    style = "Beam";
    unfocused_hollow = true;
  };

  font = {
    builtin_box_drawing = true;
    size = 11;

    bold = {
      family = "DejaVuSansMono Nerd Font";
      style = "Bold";
    };

    glyph_offset = {
      x = 0;
      y = 0;
    };

    italic = {
      family = "DejaVuSansMono Nerd Font";
      style = "Oblique";
    };

    normal = {
      family = "DejaVuSansMono Nerd Font";
      style = "Regular";
    };
  };

  keyboard.bindings = [
    {
      Key = "V";
      action = "Paste";
      mods = "Control";
    }

    {
      Key = "C";
      action = "Copy";
      mods = "Control";
    }

    {
      Key = "Q";
      action = "Quit";
      mods = "Control";
    }

    {
      Key = "N";
      action = "SpawnNewInstance";
      mods = "Control";
    }

    {
      Key = "C";
      chars = "\\u0003";
      mods = "Control|Shift";
    }

    {
      Key = "V";
      chars = "\\u0016";
      mods = "Control|Shift";
    }
  ];

  scrolling = {
    history = 10000;
    multiplier = 3;
  };

  window = {
    decorations = "None";
    opacity = 0.8;

    dimensions = {
      columns = 100;
      lines = 24;
    };
  };
}
