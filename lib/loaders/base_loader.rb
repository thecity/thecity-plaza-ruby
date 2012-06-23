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

end


