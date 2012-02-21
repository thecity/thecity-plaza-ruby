# Project::    Plaza-Ruby 
# File::       prayers.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# This class is a wrapper for the prayers page.
#
# @package TheCity
class Prayers < Plaza 

  # Constructor.
  #
  # @param PrayersLoader loader The object that loaded the data.
  def initialize(loader) 
    #super
    @json_data = loader.load_feed
  end
  
  
  # All the public prayers on the Plaza.
  #
  # @return array of prayers.
  def all_titles
    @json_data.collect { |prayer| prayer['global_prayer']['title'] }
  end
  alias :titles :all_titles
  
  
  # Get the specified prayer.
  #
  # @param index The index of the prayer to get all the information for.
  #
  # @return Prayer
  def get_prayer(index)
    Prayer.new( @json_data[index]['global_prayer'] )
  end
  alias [] :get_prayer
  
end

