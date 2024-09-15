{ lib, config, pkgs, ... }

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "Enable main user module";
    username = lib.mkOption {
      default = "robinvalk";
      description = "Username";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.username} = {
      isNormalUser = true;
      initialPassword = "fk";
      description = "Main user";
      shell = pkgs.zsh;
    };
  };
}
