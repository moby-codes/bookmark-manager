# frozen_string_literal: true

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../app.rb'

ENV['RACK_ENV'] = 'test'
Capybara.app = Bookmarks

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
  ])
SimpleCov.start
