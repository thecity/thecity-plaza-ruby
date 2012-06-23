# Project::    Plaza-Ruby 
# File::       album.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity


# A album instance.  This object is immutable.
#
# @package TheCity
class Album < PlazaCommon 
    
  # Constructor.
  #
  # @param array $data a Hash containing all the data to initialize this album.
  def initialize(data) 
    super(data)
  end
  

  # @return The ID of this album.
  #
  def id
    @data['auid'].nil? ? '' : @data['auid']
  end
    
    
  # @return The responses to the album.
  def posts
    rposts = []
    @data['posts'].each do |post|
      name = 'Unknown'
      if !post['user'].nil?
        name = post['user']['long_name']
      elsif !post['facebook_user'].nil? 
        name = [post['facebook_user']['first'], post['facebook_user']['last']].join(' ')
      end

      rposts << {:created_at => post['created_at'],
                 :who_posted => name,
                 :content    => self.clean_text( post['body'] ) }
    end                
    rposts
  end

end
    
