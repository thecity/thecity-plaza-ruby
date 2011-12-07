# Project::    OnTheCity API 
# File::       topics_loader.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class loads the Plaza topics for the subdomain.
class TopicsLoader 

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  #/
  def initialize(subdomain, cacher = nil) 
    @class_key = 'topics'   
    
    # The URL to load the topics from. 
    @url = "http://#{subdomain}.onthecity.org/plaza/topics?format=json"
    
    # The object to store and load the cache.
    @cacher = cacher unless cacher.nil?    
  end


  # Loads all the topics on the Plaza for the subdomain.
  #
  # Returns the data loaded in a JSON object.
  def load_feed
    unless @cacher.nil? or @cacher.is_cache_expired( @class_key )
      return @cacher.get_data( @class_key )
    end   

    json = open(@url).read
    data = JSON.decode(json)    

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return $data;
  end 

end