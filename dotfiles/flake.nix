{
  description = "Personal development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { pkgs, system, ... }: {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        packages.default = pkgs.buildEnv {
          name = "my-env";
          paths = with pkgs; [
            # Terminfo for terminals that ssh in
            kitty.terminfo

            # Development tools
            zsh
            tmux
            oh-my-zsh
            micro
            gh
            tree
            vscode
            difftastic
            claude-code

            # Git tools
            delta
            diff-so-fancy
            git
          ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
            patchelf  # Linux only
          ];
          pathsToLink = [ "/share" "/bin" ];
        };
      };
    };
}
