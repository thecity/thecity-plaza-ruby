# Project::    OnTheCity API 
# File::       needs.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the needs page.
class Needs

  # Constructor.
  #
  # <b>NeedsLoader loader</b> The object that loaded the data.
  def initialize(loader)
    @json_data = loader.load_feed
  end

  # Returns an array of all the needs on the plaza
  def all
    @json_data.collect { |need| need[:global_need][:title] }
  end

end