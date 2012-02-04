# Project::    OnTheCity API 
# File::       albums.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the albums page.
#
# @package OnTheCity
class Albums < Plaza 

  # Constructor.
  #
  # @param AlbumsLoader loader The object that loaded the data.
  def initialize(loader) 
    #super
    @json_data = loader.load_feed
  end
  
  
  # All the public albums on the Plaza.
  #
  # @return array of prayers.
  def all_titles
    @json_data.collect { |album| album['title'] }
  end
  
  
  # Get the specified album.
  #
  # @param index The index of the album to get all the information for.
  #
  # @return Album
  def get_album(index)
    Album.new( @json_data[index] )
  end
  
end
