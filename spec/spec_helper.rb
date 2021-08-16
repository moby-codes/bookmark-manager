require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../app.rb'

ENV['RACK_ENV'] = 'test'
Capybara.app = Bookmarks

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# For accurate test coverage measurements
# require your code AFTER 'SimpleCov.start'

# RSpec.configure do |config|
#   config.after(:suite) do
#     puts
#   end
end
