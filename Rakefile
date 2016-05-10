require 'rake'

# Default task
if ENV["TRAVIS"]
  task :default => ['site:build']
else
  task :default => ['site:watch']
end

desc "Clean the site (removes site output and metadata file) without building"
task :clean do
  sh "bundle exec jekyll clean"
end

desc "Search site and print specific deprecation warnings"
task :check do
  sh "bundle exec jekyll doctor"
end

# Load rake scripts
Dir['_rake/*.rake'].each { |r| load r }
