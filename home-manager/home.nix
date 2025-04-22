{
    inputs,
    lib,
    config,
    pkgs,
    ...
}: {
    # import other home-manager modules here
    imports = [
	# you can split up the config and import its parts here:
	# ./nvim.nix
    ];

    config = {
	allowUnfree = true;
	# https://github.com/nix-community/home-manager/issues/2942
	allowUnfreePredicate = _: true;
    };

    home = {
	username = "host";
	homeDirectory = "/home/host";
    };

    programs.neovim.enable = true;
    home.packages = with pkgs; [];

    programs.home-manager.enable = true;
    programs.git.enable = true;

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.12"
}
