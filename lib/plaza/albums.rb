# Project::    Plaza-Ruby 
# File::       albums.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# This class is a wrapper for the albums page.
#
# @package TheCity
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
    @json_data.collect { |album| album['global_album']['title'] }
  end
  
  
  # Get the specified album.
  #
  # @param index The index of the album to get all the information for.
  #
  # @return Album
  def get_album(index)
    Album.new( @json_data[index]['global_album'] )
  end
  
end
