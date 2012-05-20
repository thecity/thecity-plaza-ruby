# Project::    Plaza-Ruby 
# File::       plaza.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


 
# This is the generic class to the common Plaza attributes.
# (topic, prayer, need, event, album) will inherit from.
#
# @package TheCity
class Plaza

  # Constructor.
  #
  # @param array $data a Hash containing all the data to initialize this object.  
  def initialize
  end
    

  # Get the number of items present.
  #
  # @return integer The number of items present.
  def size
    @json_data.size
  end
  alias :length :size
  alias :count :size

end
