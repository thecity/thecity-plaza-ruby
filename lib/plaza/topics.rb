# Project::    OnTheCity API 
# File::       topics.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the topics page.
class Topics

  # Constructor.
  #
  # <b>TopicsLoader loader</b> The object that loaded the data.
  def initialize(loader)
    @json_data = loader.load_feed
  end

  # Returns an array of all the topics on the plaza
  def all
    @json_data.collect { |topic| topic[:global_topic][:title] }
  end

end