import Lambdapad

blog do
  config do
    set transform: fn(config) ->
      Map.put(config, "site_root", "/")
    end
  end

  source posts: "posts/**/*.md"

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

  widget "teletype" do
    set from: :posts
    set index: true
    set var_name: "posts"
    set template: "teletype.html"
    set transform_on_item: ["date"]
    set transform_on_page: ["order by date desc"]
  end

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

  pages "index" do
    set template: "index.html"
    set uri: "/"
  end
end
