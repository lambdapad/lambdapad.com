id: new-post
date: 2022-10-14
title: New Post

~_New in 0.8.0_~

The `new-post` command let us create a post inside of our blog structure based on the headers we have configured, or keeping which are coming by default with Lambdapad.

The command is:

```
lpad new-post pacelc-is-here \
    -b "title=PACELC is here" \
    -b "subtitle=A different approach from CAP" \
    -b "category=Databases" \
    -p posts/#{yyyy}/#{yyyy}-#{mm}-#{dd}-#{slug}.md \
    -d 2022-05-10
```

As you can see, we can define the slug name (or ID) for the blog post, and then we define different binding entries, the path where the file will be created and even the date:

- `-b` or `--bind`: let us to bind a `key=value` pair and use it in the template. The default binding values are:
  - `day`: day of the month (integer).
  - `month`: month of the year (integer).
  - `year`: year (integer 4 digits).
  - `dd`: day of the month (2 digits string).
  - `mm`: month of the year (2 digits string).
  - `yyyy`: year (4 digits string).
  - `slug`: name or ID for the post.
  - `name`: name or ID for the post.

- `-p` or `--posts-path`: let us define the name and path for the post to be created, by default it will be: `posts/#{yyyy}/#{mm}/#{dd}/#{slug}.md`

