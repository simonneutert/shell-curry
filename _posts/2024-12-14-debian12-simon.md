---
layout: post
title:  "Example Setup with Debian 12"
date:   2024-12-13 14:54:12 +0100
author: "@simonneutert"
---

Overviews of how to set up a modern terminal are a dime a dozen. But they are all different. This is my take on it.

Here's what you will end up with:

- zsh as your shell
- starship.rs as your prompt
- asdf-vm to manage your languages
- zsh-syntax-highlighting
- zsh-autosuggestions
- zsh-autocomplete
- nerd-fonts firacode
- direnv
- nodejs
- just for a modern `make`
- zoxide for a modern `cd`
- bat for a modern `cat`
- btop for a modern `top`
- lsd for a colorful `ls`
- duc for a modern `du`
- duf for a modern `df`

## End Result

The completed zshrc and zsh_aliases files can be found at the end of this guide.

## A word of warning

This guide is for debian12. If you are on a different system, some of the commands might not work.

And more importantly, please don't just copy and paste the commands. Go visit the websites of the tools (github probably) and read the docs. This is just a starting point. You will have to make these tools work for you in the end.

---

Time to spice up your terminal! 🌶️ 🍛

---

## Prerequisites

Create a fresh System/Machine/VM with debian12

## Goodbye bash, hello zsh!

1. `$ sudo apt update -y`
2. `$ sudo apt install git zsh`
3. `$ sudo chsh -s $(which zsh) $USER`

Now `exit` and log back in.

When prompted with zsh welcome, choose `0` (zero).

> Exit, creating the file ~/.zshrc containing just a comment.
> That will prevent this function being run again.

Baseline configuration, edit `~/.zshrc`:

```bash
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt autocd
```

## Nerd-Fonts

`$ sudo apt install fonts-firacode`

## starship.rs

Install with starship's interactive script (you need sudo rights):

`$ curl -sS https://starship.rs/install.sh | sh`

post-installation, add the following to your `.zshrc`:

`$ echo 'eval "$(starship init zsh)"' >> ~/.zshrc`

Then reload your shell:

`$ source ~/.zshrc`

🌟✨💅

## asdf-vm

`$ cd; git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1`

Now you need to make asdf-vm available in your shell. 

This is what your .zshrc should look exactly like at this point in time:

```bash
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt autocd

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
eval "$(starship init zsh)"
source "$HOME/.asdf/asdf.sh"
```

Resource your shell:

`$ source ~/.zshrc`

https://asdf-vm.com/more/faq.html#shell-not-detecting-newly-installed-shims

### Add asdf plugins

Let's install a language and some more tools

```bash
asdf plugin-add nodejs
asdf plugin-add just
asdf plugin-add direnv
```

### Install some versions

```bash
asdf install nodejs latest
asdf install just latest
asdf install direnv latest
```

### Set global versions

```bash
asdf global nodejs latest
asdf global just latest
asdf global direnv latest
```

Reshim asdf (to make the versions available in your shell):

```bash
asdf reshim
just --version
node --version
```

### enable direnv

Add the following to your `.zshrc`:

```bash
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```

## Make zsh work for you

Time for some zsh plugins!

### zsh-syntax-highlighting

This plugin highlights commands as you type them.

```bash
$ sudo apt intall zsh-syntax-highlighting
$ echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

### zsh-autosuggestions

Uses the history to suggest commands as you type. Navigate through the suggestions with the option/alt plus arrow keys or accept the suggestion with the right arrow key.

We install using git (the deb package did not work for me):

```bash
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
$ echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
```

### zsh-autocomplete

This will automagically show options and help.

```bash
$ git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete;
```

```bash
$ echo "source $HOME/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh" >> ~/.zshrc
```

Then force reload the current shell:

```bash
$ exec zsh
```

Try typing: `cp -r` 

## Install some tools

bat, btop, lsd, duc, duf

`$ sudo apt install -y --no-install-recommends bat btop lsd duc duf tldr`

Have a read on duc and duf  https://www.ubuntumint.com/du-command-alternatives-linux/

Or just try them out! `$ tldr duc` and `$ tldr duf`

### zoxide

It sounds scary at first. But once you trust it, you will never go back.

```bash
$ curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
$ echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
```

Add zoxide to your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

No need to enter the full path to a directory anymore. Just type `cd <directory>` (or `z <directory>` if you didnt alias, though I highly recommend it!) and zoxide will take you there.

### Config aliases (Overwrite the defaults)

Create a `.zsh_aliases` file in your home directory:

```bash
$ touch ~/.zsh_aliases
```

Make zsh use a `.zsh_aliases` file, add this to your `.zshrc`:

```bash
if [-f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi
```

Add some aliases to `~/.zsh_aliases`:

```bash
alias cd='z'
alias ls='lsd'
alias bat='batcat' # bat is installed as batcat on debian, to avoid conflicts
alias top='btop'
alias htop='btop' # if you are muscle memory bound to htop
alias du='duc'
alias df='duf'
```

## State of your `.zshrc`

After all these steps, your `.zshrc` should look like this:

```bash
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt autocd

eval "$(starship init zsh)"
source "$HOME/.asdf/asdf.sh"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

if [ -f ~/.zsh_aliases ]; then
source ~/.zsh_aliases
fi

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
```

And for completeness, your `.zsh_aliases`:

```bash
alias cd="z"
alias ls='lsd'
alias bat='batcat'
alias top='btop'
alias htop='btop' # if you are muscle memory bound to htop
alias du='duc'
alias df='duf'
```

## setopt zsh options

We added `setopt autocd` to our `.zshrc` earlier. This is a zsh option. There are many more.

`autocd` is a zsh option that allows you to go up one directory level with `..` instead of `cd ..`.

## Conclusion

With this setup, you have a modern shell with a modern prompt, modern tools, and modern plugins. For a developer, this is a good starting point. Now go and browse the docs of the tools you installed and make them work for you!

Better yet, find some tools here on the site that you find interesting and install them.
