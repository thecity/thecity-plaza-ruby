# Project::    OnTheCity API 
# File::       events.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the events page.
#
# @package OnTheCity
class Events < Plaza 

  # Constructor.
  #
  # @param EventsLoader loader The object that loaded the data.
  def initialize(loader) 
    #super
    @json_data = loader.load_feed
  end
  
  
  # All the public events on the Plaza.
  #
  # @return array of prayers.
  def all_titles
    @json_data.collect { |event| event['global_event']['title'] }
  end
  
  
  # Get the specified event.
  #
  # @param index The index of the event to get all the information for.
  #
  # @return Event
  def get_event(index)
    Event.new( @json_data[index]['global_event'] )
  end
  
end
