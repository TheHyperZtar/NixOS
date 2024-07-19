{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    clipboard.providers.wl-copy.enable = true;
    globals.mapleader = " ";
    opts = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      number = true;
      fillchars = { eob = " "; };
    };
    colorschemes = {
      catppuccin.enable = true;
      catppuccin.settings = {
        flavour = "macchiato";
        transparent_background = true;
        custom_highlights = {
          LineNr = { fg = "#939ab7"; };
        };
      };
    };
    plugins = {
      alpha = {
        enable = true;
        theme = "startify";
      };
      bufferline.enable = true;
      lualine.enable = true;
      oil.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<cr>";
        key = "<leader>ff";
        mode = "n";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
        mode = "n";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
        mode = "n";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
        mode = "n";
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<C-n>";
        mode = "n";
      }
      {
        action = "<cmd>NvimTreeFocus<CR>";
        key = "<leader>e";
        mode = "n";
      }
    ];
  };
}