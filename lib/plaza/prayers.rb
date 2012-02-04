# Project::    OnTheCity API 
# File::       prayers.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the prayers page.
#
# @package OnTheCity
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
    @json_data.collect { |prayer| prayer['title'] }
  end
  
  
  # Get the specified prayer.
  #
  # @param index The index of the prayer to get all the information for.
  #
  # @return Prayer
  def get_prayer(index)
    Prayer.new( @json_data[index] )
  end
  
end

