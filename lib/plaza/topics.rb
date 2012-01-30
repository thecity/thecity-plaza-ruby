# Project::    OnTheCity API 
# File::       topics.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the topics page.
#
# @package OnTheCity
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
  # @return array of prayers.
  def all_titles
    @json_data.collect { |topic| topic['global_topic']['title'] }
  end
  
  
  # Get the specified topic.
  #
  # @param index The index of the topic to get all the information for.
  #
  # @return Topic
  def get_topic(index)
    Topic.new( @json_data[index]['global_topic'] )
  end
  
end
