{ config, lib, pkgs, inputs, ... }:

{
  xdg.configFile.chrome = {
    enable = true;
    source = ./chrome;
    target = "/home/TheHyperZtar/.mozilla/firefox/TheHyperZtar/chrome";
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
      Preferences = { 
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "extensions.pocket.enabled" = false;
        "extensions.screenshots.disabled" = true;
        "browser.topsites.contile.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };
    };
    profiles = {
      TheHyperZtar = {
        name = "TheHyperZtar";
        isDefault = true;
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          stylus
          return-youtube-dislikes
        ];
        settings = {
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        bookmarks = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Google";
                url = "https://google.com";
              }
              {
                name = "Youtube";
                url = "https://youtube.com";
              }
              {
                name = "Gmail";
                url = "https://mail.google.com/mail/u/0";
              } 
              {
                name = "Netflix";
                url = "https://netflix.com";
              }
              {
                name = "Roblox";
                url = "https://roblox.com";
              } 
              {
                name = "Wikipedia";
                url = "https://wikipedia.org";
              }
              
              {
                name = "ChatGPT";
                url = "https://chatgpt.com";
              } 
              {
                name = "MyNixOS";
                url = "https://mynixos.com";
              }
            ];
          }
        ];
      };
    };
  };
}