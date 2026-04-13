{
  description = "Personal development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";  # For Linux x86_64
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-env";
        paths = with pkgs; [
          # Terminfo for terminals that ssh in
          kitty.terminfo

          # Development tools
          zsh
          tmux
          oh-my-zsh
          patchelf
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
        ];
        pathsToLink = [ "/share" "/bin" ];
      };
    };
}
