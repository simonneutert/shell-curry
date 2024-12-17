---
layout: post
title:  "A Dockered Example for a spiced zsh on Debian 12"
---

It's always nice to have a `Dockerfile` to start from. Here is an example of a `Dockerfile` that brings some of the tools and plugins mentioned in the [previous post](/posts/2024/12/14/debian12-simon.html).

Here's a link to the repository. You'll find the Documenation there, too ✌️

[simonneutert/shell-curry-debian-12-example](https://github.com/simonneutert/shell-curry-debian-12-example)@github

## Fire it up

```bash
$ docker run -it --rm \
    ghcr.io/simonneutert/shell-curry-debian-12-example:main
```

Inside Docker/zsh you can now type `batcat GET_STARTED.md` and complete the setup process. \
*(After having run the init.zsh script, `batcat` will be available as `bat`.)*

**Setup process inside the dockered zsh**

- `$ zsh init.zsh` # and confirm with y
- `$ source .zshrc`
- `$ bat ./.zsh_aliases` and off you go
