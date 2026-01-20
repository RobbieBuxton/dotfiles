{
  description = "Personal development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";  # For Apple Silicon, use "x86_64-darwin" for Intel Mac
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-env";
        paths = with pkgs; [
          # Development tools
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
