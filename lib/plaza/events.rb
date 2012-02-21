# Project::    Plaza-Ruby 
# File::       events.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# This class is a wrapper for the events page.
#
# @package TheCity
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
  # @return array of events.
  def all_titles
    @json_data.collect { |event| event['global_event']['title'] }
  end
  alias :titles, :all_titles
  
  
  # Get the specified event.
  #
  # @param index The index of the event to get all the information for.
  #
  # @return Event
  def get_event(index)
    Event.new( @json_data[index]['global_event'] )
  end
  alias [] :get_event
  
end
