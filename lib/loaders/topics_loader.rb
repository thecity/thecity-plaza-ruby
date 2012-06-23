# Project::    Plaza-Ruby 
# File::       topics_loader.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity


# This class loads the Plaza topics for the subdomain.
#
# @package TheCity
class TopicsLoader < BaseLoader

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  # <b>group_nickname</b> (optional) The group to get plaza items for.
  def initialize(subdomain, num_per_page = 10, cacher = nil, group_nickname = nil) 
    group_nickname = clean_group_nickname(group_nickname)
    nickname = group_nickname.empty? ? '' : '/'+group_nickname

    @class_key = "topics_#{num_per_page}_#{group_nickname}" 
    
    # The URL to load the albums from. 
    @url = "http://#{subdomain}.onthecity.org/plaza#{nickname}/topics?format=json&per_page=#{num_per_page}"
    
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
