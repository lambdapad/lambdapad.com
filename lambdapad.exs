import Lambdapad

blog do
  config do
    set transform: fn(config) ->
      config
      |> Map.put("site_root", "/")
      |> Map.put("current_year", Date.utc_today().year)
    end
  end

  source posts: "posts/**/*.md"
  source pages: "pages/**/*.md"
  source docs: "docs/**/*.md"

  transform "order by date desc" do
    set on: :page
    set run: fn(pages, _config) ->
      Enum.sort_by(pages, & &1["date"], :desc)
    end
  end

  transform "date" do
    set on: :item
    set run: fn(page, _config) ->
      %_{year: year, month: month, day: day} = Date.from_iso8601!(page["date"])
      Map.put(page, "_date", %{year: year, month: month, day: day})
    end
  end

  # widget "teletype" do
  #   set from: :posts
  #   set index: true
  #   set var_name: "posts"
  #   set template: "teletype.html"
  #   set transform_on_item: ["date"]
  #   set transform_on_page: ["order by date desc"]
  # end

  # pages "posts" do
  #   set from: :posts
  #   set uri: "/{{ post._date.year }}/{{ post._date.month }}/{{ post._date.day }}/{{ post.id }}"
  #   set var_name: "post"
  #   set template: "post.html"
  #   set transform_on_item: ["date"]
  # end

  assets "general" do
    set from: "assets/**"
    set to: "site/"
  end

  assets "lpad" do
    set from: "lpad"
    set to: "site/download/lpad"
  end

  widget "toc" do
    set from: :docs
    set var_name: "pages"
    set index: true
    set excerpt: false
    set headers: false
    set template: "toc.html"
  end

  pages "index" do
    set template: "index.html"
    set uri: "/"
  end

  pages "docs" do
    set from: :docs
    set uri: ~s[{% if page.id != "index" %}/docs/{{ page.id }}{% else %}/docs{% endif %}]
    set var_name: "page"
    set excerpt: false
    set headers: false
    set template: "doc.html"
  end

  pages "pages" do
    set from: :pages
    set uri: "/{{ page.id }}"
    set var_name: "page"
    set excerpt: false
    set headers: false
    set template: "page.html"
  end
end
