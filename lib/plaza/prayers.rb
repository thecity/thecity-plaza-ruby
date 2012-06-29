# Project::    Plaza-Ruby 
# File::       prayers.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
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
  def select(index)
    Prayer.new( @json_data[index]['global_prayer'] ) if @json_data[index]
  end


  # This method is needed for Enumerable.
  def each &block
    @json_data.each { |prayer| yield( Prayer.new( prayer['global_prayer'] ) )}  
  end    
  
end

