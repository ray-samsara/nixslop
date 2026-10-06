{
  ...
}:

{
 home-manager.users.pc =
  {
    ...
  }:
  {
    home.file.".inputrc".text = ''
      set completion-ignore-case On
    '';

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "ray-samsara";
          email = "kfreeallah@icloud.com";
        };
      };
    };

    programs.bash = {
      enable = true;
      shellAliases = {
        grep = "grep -i --color=always";
        ls = "ls --color=always -h";
        la = "ls -la";
        larth = "ls -larth";
        "goto-project-dir" = "cd /disks/media/Works/FROM_GITHUB/";
        "rebuild-flake" = "sudo nixos-rebuild switch --show-trace --flake .";
      };
    };
  };
}