require 'rake'

# Default task
task :default => ['watch']

desc "Generate the site"
task :build do
  # check_destination
  sh "bundle exec jekyll build"
end

desc "Generate the site serve locally and watch for changes (detach)"
task :serve do
  # check_destination
  sh "bundle exec jekyll serve --watch --detach"
end

desc "Generate the site with drafts, serve locally and watch for changes"
task :preview do
  sh "bundle exec jekyll serve --future --watch --drafts --unpublished"
end

desc "Generate the site serve locally and watch for changes"
task :watch do
  sh "bundle exec jekyll serve --watch"
end

desc "Clean the site (removes site output and metadata file) without building"
task :clean do
  sh "bundle exec jekyll clean"
end

desc "Search site and print specific deprecation warnings"
task :check do
  sh "bundle exec jekyll doctor"
end
