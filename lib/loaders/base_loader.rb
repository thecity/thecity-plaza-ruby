# Project::    Plaza-Ruby 
# File::       base_loader.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity

# This class loads the Plaza albums for the subdomain.
#
# @package TheCity
class BaseLoader 

  # Constructor
  def initialize(*ignore_these)
    # Paramters that may be used by the system now or in the future.
    @other_url_params = ''
  end


  # Cleans the group nickname to make sure it is valid.
  #
  # <b>group_name</b> The group nickname.
  def clean_group_nickname(group_name)
    group_name = group_name.nil? ? '' : group_name;
    group_name.downcase.strip
  end


  # Adds additional url params to be sent to the server.  These may be used by the system
  # now or in the future.
  #
  # <b>url_params</b> The additional params to send to the server.
  def add_url_params(url_params)
    @other_url_params = url_params
  end


  # Loads items.
  #
  # Returns the data loaded in a JSON object.
  def load_feed
    unless @cacher.nil? or @cacher.is_cache_expired?( @class_key )
      return @cacher.get_data( @class_key )
    end   

    @url_to_use =  
    if @other_url_params.empty?
      @url
    else
      @url + "&#{@other_url_params}"
    end

    json = open(@url_to_use).read
    begin
      data = JSON.parse(json)    
    rescue
      data = []
    end

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return data
  end 

end


