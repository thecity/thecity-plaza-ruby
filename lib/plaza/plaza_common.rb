# Project::    Plaza-Ruby 
# File::       plaza_common.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity

require 'iconv'

 
# This is the generic class to the common Plaza attributes.
# (topic, prayer, need, event, album) will inherit from.
#
# @package TheCity
class PlazaCommon

  # Constructor.
  #
  # @param array $data a Hash containing all the data to initialize this object.  
  def initialize(data)
    @data = data.nil? ? {} : data
  end
    
    
  # @return The title of this plaza item.
  #
  def title
    @data['title']
  end
    
    
  # @return When this plaza item was created.
  #
  def created_at
    @data['created_at']
  end


  # @return When this plaza item was last updated.
  #
  def updated_at
    @data['updated_at']
  end


  # @return The name of the person who made this plaza item.
  #
  def who_posted
    @data['user']['long_name']
  end
    
    
  # @return The content of this plaza item.     
  #
  def content
    self.clean_text( @data['body'] )
  end
    
    
  protected
    
   # Clean text by removing html tags and other special characters.
   #
   # @return Clean text.
  def clean_text(text)
    text = text.gsub(%r{</?[^>]+?>}, '')    
    text.strip!
    begin
      ic_ignore = Iconv.new('US-ASCII//IGNORE', 'UTF-8')
      ic_ignore.iconv(text)
    rescue
      text
    end
  end


end
