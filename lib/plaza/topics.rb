# Project::    Plaza-Ruby 
# File::       topics.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity


# This class is a wrapper for the topics page.
#
# @package TheCity
class Topics < Plaza 

  # Constructor.
  #
  # @param TopicsLoader loader The object that loaded the data.
  def initialize(loader) 
    #super
    @json_data = loader.load_feed
  end
  
  
  # All the public topics on the Plaza.
  #
  # @return array of topics.
  def all_titles
    @json_data.collect { |topic| topic['global_topic']['title'] }
  end
  alias :titles :all_titles
  
  
  # Get the specified topic.
  #
  # @param index The index of the topic to get all the information for.
  #
  # @return Topic
  def select(index)
    Topic.new( @json_data[index]['global_topic'] ) if @json_data[index]
  end
  

  # This method is needed for Enumerable.
  def each &block
    @json_data.each { |topic| yield( Topic.new( topic['global_topic'] ) )}
  end    

end
