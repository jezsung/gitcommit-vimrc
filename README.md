# gitcommit-vimrc

A minimal Vim configuration that enforces git commit message best practices.

- **50 character subject line** - Automatically truncates the first line to 50 characters
- **Blank second line** - Enforces a blank line between subject and body
- **72 character body** - Wrap text width to 72 with a visual column guide at 73
- **Spell checking** - Enables English spell checking for commit messages

![Demo](demo.gif)

## Setup

### Vim

#### 1. Set Vim as your git editor

```bash
git config --global core.editor "vim"
```

#### 2. Download the configuration

##### New to Vim

If you don't have a `~/.vimrc` file yet, follow these instructions. This will create a new Vim configuration file for you.

```bash
curl -fsSL https://raw.githubusercontent.com/jezsung/gitcommit-vimrc/main/.vimrc -o ~/.vimrc
```

##### Existing Vim configuration

If you already have a `~/.vimrc` file with your own customizations, follow these instructions. This will add the git commit settings to your existing configuration without overwriting it.

Download this Vim configuration:

```bash
curl -fsSL https://raw.githubusercontent.com/jezsung/gitcommit-vimrc/main/.vimrc -o ~/.gitcommit.vim
```

Then add the source line to your existing `~/.vimrc`:

```bash
echo 'source ~/.gitcommit.vim' >> ~/.vimrc
```

### Neovim

#### 1. Set Neovim as your git editor

```bash
git config --global core.editor "nvim"
```

#### 2. Download the ftplugin

```bash
mkdir -p ~/.config/nvim/ftplugin
curl -fsSL https://raw.githubusercontent.com/jezsung/gitcommit-vimrc/main/ftplugin/gitcommit.lua -o ~/.config/nvim/ftplugin/gitcommit.lua
```

## Usage

Run `git commit` in your terminal. Vim will automatically detect the commit message file and apply this configuration. You'll immediately benefit from:

- Subject line truncation at 50 characters
- Automatic blank second line enforcement
- Text wrapping at 72 characters with a visual guide
- Spell checking for your commit messages

No additional commands or setup required.
