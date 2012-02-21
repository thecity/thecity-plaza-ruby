# Project::    Plaza-Ruby 
# File::       needs.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# This class is a wrapper for the needs page.
#
# @package TheCity
class Needs < Plaza 

  # Constructor.
  #
  # @param NeedsLoader loader The object that loaded the data.
  def initialize(loader) 
    #super
    @json_data = loader.load_feed
  end
  
  
  # All the public needs on the Plaza.
  #
  # @return array of prayers.
  def all_titles
    @json_data.collect { |need| need['global_need']['title'] }
  end
  
  
  # Get the specified need.
  #
  # @param index The index of the need to get all the information for.
  #
  # @return Need
  def get_need(index)
    Need.new( @json_data[index]['global_need'] )
  end
  
end

