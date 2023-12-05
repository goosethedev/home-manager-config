{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  programs.firefox.package = pkgs.firefox.override {
    nativeMessagingHosts = [ pkgs.passff-host ];
  };
  # Don't try to install gnome-browser-connector on non-NixOS. Doesn't work.

  programs.firefox.profiles."goose" = {
    id = 0;
    name = "goose";
    
    containers = {
      sergiodev = {
    	  color = "yellow";
    	  icon = "fingerprint";
    	  id = 2;
    	  name = "SergioDev";
    	};
    	goose = {
    	  color = "turquoise";
    	  icon = "fingerprint";
    	  id = 1;
    	  name = "Goose";
    	};
    };

    # Managed by Mozilla Sync
    extensions = [];

    search = {
      default = "DuckDuckGo";
      privateDefault = "DuckDuckGo";
      force = true;
    	engines = {
        "Nix Packages" = {
    	    urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
    	  "NixOS Wiki" = {
          urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
          iconUpdateURL = "https://nixos.wiki/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@nw" ];
        };
    	  "Home Manager Options" = {
          urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}"; }];
          iconUpdateURL = "https://mipmip.github.io/home-manager-option-search/images/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@hm" ];
        };
    	  "YouTube" = {
          urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
          iconUpdateURL = "https://www.youtube.com/s/desktop/bd3558ba/img/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@y" "@yt" ];
        };
        "Bing".metaData.hidden = true;
        "Amazon.com".metaData.hidden = true;
        "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
    	};
    };

    settings = {
      "browser.newtabpage.pinned" = "[]";
      "devtools.toolbox.host" = "right";
      "services.sync.username" = "goosethedev@proton.me";
    };
  };
}
