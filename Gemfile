source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.0"

# Use the 5.2 stable branch from github
gem "rails", github: "rails/rails", branch: "5-2-stable"
gem "sqlite3"
gem "puma", "~> 3.11"
gem "webpacker"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "faker"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "minitest-rails"
  gem "pry"
  gem "pry-doc"
  gem "rails-controller-testing"
  gem "rubocop-rails_config"
  gem "simplecov", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
