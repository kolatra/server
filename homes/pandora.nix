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

    home.packages = with pkgs; [
        zsh
        oh-my-zsh
    ];

    home.file.".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/config/dotfiles/.zshrc";
    };

    home.file.".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/config/dotfiles/kickstart.nvim";
    };

    home.file.".oh-my-zsh" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/${user}/config/dotfiles/oh-my-zsh";
    };

    programs.home-manager.enable = true;

    programs.git = {
        enable = true;
        userName = "${user}";
        userEmail = "3821892+kolatra@users.noreply.github.com";
    };

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.11";
}
