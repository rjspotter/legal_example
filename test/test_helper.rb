require "simplecov"
SimpleCov.start
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

require "minitest/pride"

class ActiveSupport::TestCase

  def setup
    Rails.application.load_seed
  end

  # Add more helper methods to be used by all tests here...
end
