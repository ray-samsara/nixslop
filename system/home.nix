{
  pkgs,
  nix4nvchad,
  ...
}:

{
  home-manager.users.pc = {
    imports = [
      nix4nvchad.homeManagerModules.default
    ];

    home.stateVersion = "26.05";

    # ghostty
    programs.ghostty = {
      enable = true;
      package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

      # Enable for whichever shell you plan to use!
      enableBashIntegration = true;

      settings = {
        theme = "Adwaita Dark";
        font-family = "Iosevka Extended";
      };
    };

    # neovim
    programs.nvchad.enable = true;
    programs.nvchad.neovim = pkgs.neovim-unwrapped;
    programs.nvchad.extraConfig = ''
      -- Custom vim options
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.expandtab = true
    '';
    programs.nvchad.chadrcConfig = ''
      local M = {}
      M.ui = {
        theme = "catppuccin",
        transparency = true,
      }
      return M
    '';

    home.packages = with pkgs; [
      gnomeExtensions.appindicator
      gnomeExtensions.system-monitor
      gnomeExtensions.user-themes
      gnomeExtensions.caffeine
      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
    ];

    dconf.settings."org/gnome/shell".enabled-extensions = with pkgs; [
      gnomeExtensions.appindicator.extensionUuid
      gnomeExtensions.system-monitor.extensionUuid
      gnomeExtensions.user-themes.extensionUuid
      gnomeExtensions.caffeine.extensionUuid
      gnomeExtensions.dash-to-dock.extensionUuid
      gnomeExtensions.blur-my-shell.extensionUuid
    ];
  };
}
