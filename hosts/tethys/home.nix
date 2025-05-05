{ inputs, config, pkgs, ... }: 
let user = "tyler"; 
in {
    imports = [

    ];

    home = {
        username = "${user}";
        homeDirectory = "/home/${user}";
    };

    programs.neovim.enable = true;
    programs.firefox.enable = true;

    home.packages = with pkgs; [
        zsh
        oh-my-zsh
    ];

    home.file.".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/.dotfiles/dotfiles/.zshrc";
    };

    home.file.".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/.dotfiles/dotfiles/kickstart.nvim";
    };

    home.file.".oh-my-zsh" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/.dotfiles/dotfiles/oh-my-zsh";
    };

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
