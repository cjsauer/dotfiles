Various *NIX dotfiles that I've configured over the years.

## Requirements

GNU stow is the only dependency:

```bash
# Ubuntu
sudo apt-get install stow

# Mac
brew install stow
```

## Usage

```bash
cd ~/dotfiles
stow git
stow spacemacs
stow lein
# etc
```

To uninstall some configuration:

```bash
stow -D spacemacs
```