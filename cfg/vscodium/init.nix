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
      home.file.".config/VSCodium/user/settings.json".source =
        config.lib.file.mkOutOfStoreSymlink "/home/pc/.nixslop/home/VSCodium/User/settings.json";
    };
}