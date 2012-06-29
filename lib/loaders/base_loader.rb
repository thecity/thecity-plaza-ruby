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
  def initialize() 
    # Do nothing
  end


  # Cleans the group nickname to make sure it is valid.
  #
  # <b>group_name</b> The group nickname.
  def clean_group_nickname(group_name)
    group_name = group_name.nil? ? '' : group_name;
    group_name.downcase.strip
  end


  # Loads items.
  #
  # Returns the data loaded in a JSON object.
  def load_feed
    unless @cacher.nil? or @cacher.is_cache_expired?( @class_key )
      return @cacher.get_data( @class_key )
    end   

    json = open(@url).read
    begin
      data = JSON.parse(json)    
    rescue
      data = []
    end

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return data
  end 

end


