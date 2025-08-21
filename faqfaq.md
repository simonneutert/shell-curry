---
layout: page
title: FAQ (we ask the web)
description: "A list of questions we ask the web from time to time. Like, how to switch from bash to zsh."
---

## Table of Contents<!-- omit in toc -->

- [Change Shell](#change-shell)
- [Add a directory to PATH](#add-a-directory-to-path)

### Change Shell

`$ sudo chsh -s $(which zsh) $USER`

`chsh` is the command to change shell. \
`-s` is the flag to specify the shell. \
`$(which zsh)` is the path to the shell you want to use. \
`$USER` is the user you want to change the shell for.

### Add a directory to PATH

`$ export PATH=$PATH:/path/to/directory`

#### In `.zshrc` / `.bashrc` or similar (*_profile)<!-- omit in toc -->

```bash
export PATH=$PATH:/path/to/directory
```

**Example:** `$HOME/.local/bin` like what zoxide suggests.

```bash
export PATH=$PATH:$HOME/.local/bin
```
