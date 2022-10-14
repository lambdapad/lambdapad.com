id: templates
date: 2022-05-16
title: Templates

[ED]: https://github.com/erlydtl/erlydtl
[DT]: https://docs.djangoproject.com/en/3.1/topics/templates

At this moment we support only [ErlyDTL][ED] for templates. This is based on [Django Templates][DT] and in use for different systems in the Python ecosystem.

Depending on the configuration you use, you could have different information available into the template. The configuration from `config.toml` is inserted as is into the template so, for example, the information into the section `blog` for `url` could be accesible using:

```htmldjango
{{ blog.url }}
```

And if we configure `var_name` for posts as `"posts"`, we can find a list of posts retrieved from the amount of files we have into the `posts/**.md` searching wildcard as:

```htmldjango
{% for post in posts %}
<div class='post'>
  <h1><a name='#{{ post.id }}'>{{ post.title }}</a></h1>
  {{ post.excerpt }}
</div>
{% endfor %}
```

Lambdapad also insert information inside of the template if you want to use it like this:

```htmldjango
<generator uri="{{ lambdapad.url }}" version="{{ lambdapad.vsn }}">{{ lambdapad.name }}</generator>
```

- `lambdapad.name` is set as `Lambdapad`
- `lambdapad.url` is set as https://lambdapad.com
- `lambdapad.vsn` is set as the version number of the Lambdapad in use, at this moment: `0.1.0`
- `lambdapad.description` is set as `Static website generator`
- `build.date` is when the website was generated
- `build.year` is the year when the website was generated
- `build.month` is the month when the website was generated
- `build.day` is the day when the website was generated

From every post we have also, and usually, available the following data:

- `excerpt`: it's the text choosen as excerpt. If we configure the excerpt as false then it's going to be empty. It's clean text and all of the possible tags (i.e. strong, em or links) are removed.
- `excerpt_html`: it's the HTML version of the excerpt.
- `content`: the HTML content for the page.
- `id`: it could be given from headers or set by Lambdapad if we disabled headers.
