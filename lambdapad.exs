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
      if page_date = page["date"] do
        %_{year: year, month: month, day: day} = Date.from_iso8601!(page_date)
        Map.put(page, "_date", %{year: year, month: month, day: day})
      else
        today = Date.utc_today()

        page
        |> Map.put("date", to_string(today))
        |> Map.put("_date", today)
      end
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

  # copy `lpad` binary to the download space
  assets "lpad" do
    set from: "lpad"
    set to: "site/download/lpad"
  end

  pages "index" do
    set template: "index.html"
    set uri: "/"
  end

  # Documentation

  # Table of Contents
  widget "toc" do
    set from: :docs
    set var_name: "pages"
    set index: true
    set excerpt: false
    set headers: true
    set template: "toc.html"
  end

  pages "docs" do
    set from: :docs
    set uri: ~s[{% if page.id != "index" %}/docs/{{ page.id }}{% else %}/docs{% endif %}]
    set var_name: "page"
    set excerpt: false
    set headers: true
    set template: "doc.html"
  end

  # Other pages (i.e. About)
  pages "pages" do
    set from: :pages
    set uri: "/{{ page.id }}"
    set var_name: "page"
    set excerpt: false
    set headers: false
    set template: "page.html"
    set transform_on_item: ["date"]
  end
end
