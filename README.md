```
      ██            ██     ████ ██  ██                
     ░██           ░██    ░██░ ░░  ░██                
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░ 
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████ 
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████ 
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░  
 
  ▓▓▓▓▓▓▓▓▓▓
 ░▓ about  ▓ custom linux config files
 ░▓ author ▓ calvin
 ░▓▓▓▓▓▓▓▓▓▓
 ░░░░░░░░░░


 git            > global git configuration and settings
 terminator     > terminator terminal emulator settings, themes, etc
 vim            > vimrc setup and plugin definitions
 zsh            > zshell settings, aliases, and custom prompts (oh-my-zsh is required!)
 lein           > Clojure build tool
 spacemacs      > The power of emacs and vim combined
```

(Idea and readme copied from [xero](https://github.com/xero/dotfiles))

## Setup

These dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/),
the symlink farm manager. To get setup:

```bash
sudo apt-get install stow
cd ~
git clone git@github.com:cjsauer/dotfiles.git
```

One liner:

```bash
sudo apt-get install stow && cd ~ && git clone git@github.com:cjsauer/dotfiles.git
```

## Usage

To put configuration into effect, you can `stow` it from within the `dotfiles/`
directory:

```bash
cd ~/dotfiles/
stow git
stow spacemacs
stow lein
# etc
```

To uninstall some configuration:

```bash
stow -D spacemacs
```

## Editor

[spacemacs](http://spacemacs.org/) is my editor of choice, and can be installed
in a simple one liner:

```bash
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

### Vim

For very lightweight editing and remote work, vim is much quicker. A couple
plugins have external dependencies:

```bash
sudo apt-get install build-essential cmake
```

Now run `vim` and use the `:PlugInstall` command to download and install all the
vim plugin goodness.
