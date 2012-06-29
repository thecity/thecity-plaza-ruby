# Project::    Plaza-Ruby 
# File::       needs.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
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
  # @return array of needs.
  def all_titles
    @json_data.collect { |need| need['global_need']['title'] }
  end
  alias :titles :all_titles
  
  
  # Get the specified need.
  #
  # @param index The index of the need to get all the information for.
  #
  # @return Need
  def select(index)
    Need.new( @json_data[index]['global_need'] ) if @json_data[index]
  end
  

  # This method is needed for Enumerable.
  def each &block
    @json_data.each { |need| yield( Need.new( need['global_need'] ) )}  
  end  

end

