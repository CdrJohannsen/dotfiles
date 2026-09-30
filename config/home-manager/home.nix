{
  config,
  pkgs,
  lib,
  ...
}:
{
  services = {
    autotiling.enable = true;
    wl-clip-persist.enable = true;
    polkit-gnome.enable = true;
    swaync = {
      enable = true;
      settings = lib.importJSON ./swaync/config.json;
    };
    swayosd = {
      enable = true;
    };
    swayidle = {
      enable = true;
      events = {
        after-resume = "killall openrgb && openrgb --startminimized";
        before-sleep = "pidof gtklock || gtklock -d";
        lock = "pidof gtklock || gtklock -d";
      };
      timeouts = [
        {
          timeout = 300;
          command = "loginctl lock-session";
        }
        {
          timeout = 400;
          command = "systemctl suspend";
        }
      ];
    };
    wlsunset = {
      enable = true;
      latitude = 50;
      longitude = 10;
    };
    # TODO: gtk, nvim, qt
  };

  programs = {
    wofi = {
      enable = true;
      settings = {
        width = 600;
        height = 500;
        location = "center";
        show = "drun";
        prompt = "Apps";
        filter_rate = 50;
        allow_markup = false;
        no_actions = true;
        halign = "fill";
        orientation = "vertical";
        content_halign = "fill";
        insensitive = true;
        allow_images = true;
        image_size = 40;
        gtk_dark = true;
        term = "alacritty";
        parse_search = true;
        close_on_focus_loss = true;
      };
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = import ./starship.nix;
    };
    alacritty = {
      enable = true;
      settings = import ./alacritty.nix;
    };
    waybar = {
      enable = true;
      systemd.enable = true;
      settings = import ./waybar/config.nix;
    };
  };

  home = {
    packages = with pkgs; [
      nwg-launchers
    ];
    keyboard.layout = "de(nodeadkeys)";
    keyboard.options = [
      "lv3:caps_switch"
      "lv5:rctrl_switch"
      "compose:ralt"
      "nbsp:zwnj2zwj3nb4"
      "keypad:oss"
      "kpdl:commaoss"
    ];
    preferXdgDirectories = true;
    shell.enableBashIntegration = true;
    shellAliases = {
      update = "sudo dnf upgrade --refresh && flatpak upgrade";
      c = "clear";
      ls = "eza -A --color=auto --group-directories-first -h";
      lock = "loginctl lock-sessions";
      vim = "nvim";
      cat = "bat";
      grep = "rg";
      fzf = "fzf --preview 'bat --color=always --style=numbers {}'";
      find = "fd";
      ":q" = "exit";
      ":wq" = "exit";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      powersave = "~/Documents/Coding/Bash/power-saver.sh";
    };

    language = {
      base = "en_US.UTF-8";
      address = "de_DE.UTF-8";
      measurement = "de_DE.UTF-8";
      monetary = "de_DE.UTF-8";
      name = "de_DE.UTF-8";
      numeric = "de_DE.UTF-8";
      paper = "de_DE.UTF-8";
      telephone = "de_DE.UTF-8";
      time = "de_DE.UTF-8";
    };

  };

  nix.assumeXdg = true;

  xdg = {
    configFile."swayosd/config.toml".source = ./swayosd/config.toml;
    configFile."swayosd/style.css".source = ./swayosd/style.css;

    configFile."swaync/style.css".source = ./swaync/style.css;
    configFile."swaync/colors.css".source = ./swaync/colors.css;

    configFile."wofi/style.css".source = ./wofi/style.css;

    configFile."waybar/style.css".source = ./waybar/style.css;
    configFile."waybar/style.css".onChange = "killall -s SIGUSR2 -r waybar";

    configFile."nwg-launchers/" = {
      source = ./nwg-launchers;
      recursive = true;
    };

    autostart.enable = true;
    localBinInPath = true;
  };

  targets.genericLinux.enable = true;

  home.username = "cdr-johannsen";
  home.homeDirectory = "/home/cdr-johannsen";

  home.stateVersion = "26.05";
}
