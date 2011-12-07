# Project::    OnTheCity API 
# File::       events.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the events page.
class Events

  # Constructor.
  #
  # <b>EventsLoader loader</b> The object that loaded the data.
  def initialize(loader)
    @json_data = loader.load_feed
  end

  # Returns an array of all the events on the plaza
  def all
    @json_data.collect { |event| event[:global_event][:title] }
  end

end