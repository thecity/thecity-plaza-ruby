# Project::    OnTheCity API 
# File::       spec_helper.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity

require 'rubygems'
require 'rspec'
require 'ruby-debug'

require File.expand_path( File.dirname(__FILE__) + '/../lib/on_the_city.rb')


RSpec.configure do |config|
  config.mock_with :rspec
end