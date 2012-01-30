# Project:    OnTheCity API 
# File:       plaza_common.rb
#
# @author Wes Hays <weshays@gbdev.com> 
# @link https://github.com/weshays/onthecity-api-php
# @version 1.0a
# @package OnTheCity


 
# This is the generic class to the common Plaza attributes.
# (topic, prayer, need, event, album) will inherit from.
#
# @package OnTheCity
class PlazaCommon

  # Constructor.
  #
  # @param array $data a Hash containing all the data to initialize this object.  
  def initialize(data)
    @data = data
  end
    
    
  #
  # @return The title of this plaza item.
  #
  def title
    @data[:title]
  end
    
    
  #
  # @return When this plaza item was created.
  #
  def created_at
    @data[:created_at]
  end


  #
  # @return The name of the person who made this plaza item.
  #
  def who_posted
    @data[:user][:long_name]
  end
    
    
  #
  # @return The content of this plaza item.     
  #
  def content
    self.clean_text( @data[:body] )
  end
    
    
  protected
    
   # Clean text by removing html tags and other special characters.
   #
   # @return Clean text.
  def clean_text(text)
    # $text = strip_tags( $text );
    # return iconv("UTF-8", "ISO-8859-1//IGNORE", $text);
    text.strip
  end

end
