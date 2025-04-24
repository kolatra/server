{
    inputs,
    lib,
    config,
    pkgs,
    ...
}: {
    imports = [

    ];

    config = {
        allowUnfree = true;
        # https://github.com/nix-community/home-manager/issues/2942
        allowUnfreePredicate = _: true;
    };

    home = {
        username = "tyler";
        homeDirectory = "/home/tyler";
    };

    programs.neovim.enable = true;
    home.packages = with pkgs; [
        zsh
    ];

    home.file.".zshrc" = {
        source = lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dotfiles/.zshrc";
    };

    home.file.".config/nvim" = {
        source = lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dotfiles/kickstart.nvim";
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
        userEmail = "3821892+kolatra@users.noreply.github.com"
    };

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.11"
}
