# Project::    Plaza-Ruby 
# File::       topics_loader.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# This class loads the Plaza topics for the subdomain.
#
# @package TheCity
class TopicsLoader 

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  #/
  def initialize(subdomain, cacher = nil) 
    @class_key = 'topics'   
    
    # The URL to load the topics from. 
    @url = "http://#{subdomain}.onthecity.org/plaza/topics.json"
    
    # The object to store and load the cache.
    @cacher = cacher unless cacher.nil?    
  end


  # Loads all the topics on the Plaza for the subdomain.
  #
  # Returns the data loaded in a JSON object.
  def load_feed
    unless @cacher.nil? or @cacher.is_cache_expired?( @class_key )
      return @cacher.get_data( @class_key )
    end   

    json = open(@url).read
    data = JSON.parse(json)    

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return data
  end 

end
