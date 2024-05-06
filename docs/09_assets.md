id: assets
date: 2022-05-16
title: Assets

By default, if we are not indicating anything, the configuration block understood by the system is this one:

```elixir
assets "general" do
  set from: "assets/**"
  set to: "site/"
end
```

This is meaning to copy everything from `assets` directory into the `site` directory.
