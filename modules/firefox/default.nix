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
          urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}"; }];
          iconUpdateURL = "https://mipmip.github.io/home-manager-option-search/images/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@hm" ];
        };
        "GitHub" = {
          urls = [{ template = "https://github.com/search?q={searchTerms}&type=repositories";}];
          iconUpdateURL = "https://github.githubassets.com/favicons/favicon-dark.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@gh" ];
        };
        "Arch Wiki" = {
          urls = [{ template = "https://wiki.archlinux.org/index.php?title=Special:Search&profile=default&search={searchTerms}";}];
          iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@aw" ];
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

      # Allow extensions on sites with restrictions
      "extensions.quarantineIgnoredByUser.78272b6fa58f4a1abaac99321d503a20@proton.me" = true;
      "extensions.quarantineIgnoredByUser.vimium-c@gdh1995.cn" = true;
      "extensions.quarantineIgnoredByUser.{84601290-bec9-494a-b11c-1baa897a9683}" = true;
      "extensions.quarantineIgnoredByUser.{a2503cd4-4083-4c2f-bef2-37767a569867}" = true;
    };
  };
}
