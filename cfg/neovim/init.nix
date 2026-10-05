{
  ...
}:

{
  home-manager.users.pc =
  {
    config,
    ...
  }:

  {
    home.file.".config/nvim/lua/plugins/lspconfig.lua".source = ./lspconfig.lua;
  };
}
