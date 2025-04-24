{
    inputs,
    config,
    pkgs,
    ...
}: {
    imports = [

    ];

    home = {
        username = "tyler";
        homeDirectory = "/home/tyler";
    };

    programs.neovim.enable = true;
    home.packages = with pkgs; [
        zsh
    ];

    home.file.".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tyler/config/dotfiles/.zshrc";
    };

    home.file.".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tyler/config/dotfiles/kickstart.nvim";
    };

    # not sure yet if I need this
    # xdg.configFile = {
    #   "zsh" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/zsh";
    #     recursive = true;
    #   };
    #   # ...
    # };

    programs.home-manager.enable = true;

    programs.git = {
        enable = true;
        userName = "tyler";
        userEmail = "3821892+kolatra@users.noreply.github.com";
    };

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.11";
}
