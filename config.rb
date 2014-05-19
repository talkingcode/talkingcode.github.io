Time.zone = "Pacific Time (US & Canada)"

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
###
# Helpers
###
activate :livereload
activate :syntax

activate :blog do |blog|
  blog.name = "blog"
  blog.permalink = ":title.html"
  blog.layout = "blog_layout"
  blog.prefix = "blog"
end

activate :blog do |blog|
  blog.name = "podcast"
  blog.permalink = ":title.html"
  blog.layout = "podcast_layout"
  blog.prefix = "podcast"
  blog.publish_future_dated = true
end


activate :directory_indexes

activate :deploy do |deploy|
  deploy.build_before = true

  deploy.method = :git
  deploy.remote = "github"
  deploy.branch = "gh-pages"
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, ignore: [/^images\/twitter_cards/]

  # Use relative URLs
  # activate :relative_assets
  # set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end