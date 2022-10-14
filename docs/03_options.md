id: options
date: 2022-05-16
title: Options for Configuration

[DT]: https://docs.djangoproject.com/en/3.1/topics/templates
[TOML]: https://github.com/toml-lang/toml
[EEx]: https://hexdocs.pm/eex/EEx.html

As you can see, at the moment, you can choose between Elixir or Erlang. You can write the way your web site is going to be generated based on those two options. But we can also decide about:

- **Templates**: we can write the templates using one of these options:
  - `erlydtl` (default): it's using [ErlyDTL or Django Templates][DT].
  - `eex`: using [EEx][EEx] library instead ([WIP](https://github.com/altenwald/lambdapad/discussions/3))
  - `wordpress_theme`: yes! we could use Wordpres Themes to build the site ([WIP](https://github.com/altenwald/lambdapad/discussions/4))

- **Configuration**: we can write extracts of data to be in use for our templates, transforms, etc. in these formats:
  - `toml` (default): it's using [TOML][TOML]. Very powerful and simple.
  - `eterm`: Erlang Terms, also easy if you are using the Erlang way.
  - `yaml`: Sometimes it's difficult, sometimes it's easy, but well, you can check it out yourself ([WIP](https://github.com/altenwald/lambdapad/discussions/6)).
  - `json`: Not good for humans but, hey! if you have a generated JSON, why not using it in the static web generator? ([WIP](https://github.com/altenwald/lambdapad/discussions/7))
  - `markdown`: well, this is not a configuration system indeed, but it's a way to inject documents as variables to be in use into the templates when they are secondary ([WIP](https://github.com/altenwald/lambdapad/discussions/9))

- **Script**: as we said from the very begining we are using Erlang and Elixir. I've no plans at the moment to increase the number of languages to write these scripts, but based on the languages available on top of BEAM, we could do something to integrate PHP, OCaml, Gleam, Lua, or another. If you want... no, if you really want to get any one of these working on Lambdapad, [open a discussion](https://github.com/altenwald/lambdapad/discussions).

- **Documents**: when we are defining the documents which could be in use for generating pages, we are indicating mainly Markdown files. At this moment these are the only on document format supported and there is no intention to include more in near future. Markdown is ok.
