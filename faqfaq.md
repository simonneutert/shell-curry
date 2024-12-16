---
layout: page
title: FAQ (we ask the web)
description: "A list of questions we ask the web from time to time. Like, how to switch from bash to zsh."
---

#### Table of Contents<!-- omit in toc -->

- [Change Shell](#change-shell)

## Change Shell

`sudo chsh -s $(which zsh) $USER`

chsh is the command to change shell. \
`-s` is the flag to specify the shell. \
`$(which zsh)` is the path to the shell you want to use. \
`$USER` is the user you want to change the shell for.
