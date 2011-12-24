/** 
 * Project:    OnTheCity API 
 * File:       album.rb
 *
 * @author Wes Hays <weshays@gbdev.com> 
 * @link https://github.com/weshays/onthecity-api-php
 * @version 1.0a
 * @package OnTheCity
 */


/** 
 * A album instance.  This object is immutable.
 *
 * @package OnTheCity
 */
class Album < PlazaCommon 
  
  # Constructor.
  #
  # @param array $data a Hash containing all the data to initialize this album.
  #
  def initialize(data)
    super(data);
  end
  
  
  /**
   * @return The responses to the album.
   */
  def posts
    $rposts = []
    self.data.album_responses.each do |album_response| 
      name = 'Unknown'
      if !album_response.user.blank?
        name = album_response.user.long_name
      elsif !album_response.facebook_user.blank?
        name = [album_response.facebook_user.first, album_response.facebook_user.last].join(' ')
      }

      $rposts << {
        :created_at => album_response->created_at,
        :who_posted => name,
        :content    => self.clean_text( album_response.body )
      }
    end
    rposts
  end
  
end
