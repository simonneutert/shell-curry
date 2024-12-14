# shell-curry

This website is an opiomated list of tools and software we use on a daily basis.

We hope you find it useful and that it helps you discover new tools to improve your workflow.

#### Rice your desktop, spice up your shell!

## Setup

As this is a Jekyll site, you should read the [Jekyll documentation](https://jekyllrb.com/docs/).

All the tools are stored in the `_data/tools.yml` file.

The categories can be determined by the `category` field in the YAML file - or when browsing to `localhost:4000/rack`.

## Run the development server

```bash
bundle exec jekyll serve
```

### Requirements

- Ruby >= v3.3

#### Install gems/packages

```bash
bundle install
```

### Docker Demo

```bash
docker build -t shell-curry .
docker run --rm -ti -p 4000:4000 shell-curry
```

## Contributing

We are happy to keep this list up-to-date and to add new tools. If you have a tool you would like to share, please share it as an issue first.

We won't guarantee that your tool will be added, but we will review it.

If, in the future, more and more tools are suggested, we shall keep them in a separate list ✌️

