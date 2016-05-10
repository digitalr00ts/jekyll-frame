namespace :site do
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
end
