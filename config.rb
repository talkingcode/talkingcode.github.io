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

# activate :deploy do |deploy|
#   deploy.build_before = true

#   deploy.method = :git
#   deploy.remote = "github"
#   deploy.branch = "master"
# end

activate :deploy do |deploy|
  deploy.method       = :sftp
  deploy.host         = ENV['SFTP_HOST']
  deploy.port         = ENV['SFTP_PORT']
  deploy.path         = '/var/www/talkingcode.com/html'
  deploy.user         = ENV["SFTP_USER"]
  deploy.build_before = true # default: false
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

# Build-specific configuration
configure :build do
  activate :gzip
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, ignore: [/^images\/twitter_cards/]

  activate :minify_html do |html|
    html.remove_multi_spaces        = true
    html.remove_comments            = true
    html.preserve_line_breaks       = false
    html.remove_intertag_spaces     = true

    html.remove_quotes              = false
    html.simple_doctype             = false
    html.remove_script_attributes   = false
    html.remove_style_attributes    = false
    html.remove_link_attributes     = false
    html.remove_form_attributes     = false
    html.remove_input_attributes    = false
    html.remove_javascript_protocol = false
    html.remove_http_protocol       = false
    html.remove_https_protocol      = false
    html.simple_boolean_attributes  = false
  end
end