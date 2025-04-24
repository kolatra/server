{
    inputs,
    config,
    pkgs,
    ...
}: let user = "tyler"; in {
    imports = [

    ];

    home = {
        username = "${user}";
        homeDirectory = "/home/tyler";
    };

    programs.neovim.enable = true;
    home.packages = with pkgs; [
        zsh
        oh-my-zsh
    ];

    programs.zsh = {
        enable = true;
        enableCompletions = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [
                "sudo"
            ];
        };
    };

    home.file.".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/config/dotfiles/.zshrc";
    };

    home.file.".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/config/dotfiles/kickstart.nvim";
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
        userName = "${user}";
        userEmail = "3821892+kolatra@users.noreply.github.com";
    };

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.11";
}
