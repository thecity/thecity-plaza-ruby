require "#{File.dirname(__FILE__)}/../spec_helper"

class TopicsLoaderStaging

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  #/
  def initialize(subdomain, cacher = nil) 
    @class_key = 'topics'   
    
    # The URL to load the topics from. 
    @url = "http://#{subdomain}.stagethecity.org/plaza/topics.json"
    
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



describe 'OnTheCity::Plaza::Topics' do

  it 'should create an instance successfully with valid arguments' do
    subdomain = 'livingstones'
    loader = TopicsLoaderStaging.new(subdomain, nil)
    topics = Topics.new(loader)
    topics.all_titles.class.should == Array
  end

  
end