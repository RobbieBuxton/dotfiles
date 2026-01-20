# Ensure nix profile is in PATH
if [ -d "$HOME/.nix-profile/bin" ]; then
    export PATH="$HOME/.nix-profile/bin:$PATH"
fi

# Set up common environment variables
export EDITOR="micro"
export VISUAL="micro"

# Load custom environment variables if they exist
if [ -f "$HOME/.zshenv-custom" ]; then
    source "$HOME/.zshenv-custom"
fi
