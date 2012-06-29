# Project::    Plaza-Ruby 
# File::       prayer.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity


# A prayer instance.  This object is immutable.
#
# @package TheCity
class Prayer < PlazaCommon 
    
	# Constructor.
	#
	# @param array $data a Hash containing all the data to initialize this prayer.
  def initialize(data) 
    super(data)
  end


  # @return The ID of this prayer.
  #
  def id
    @data['puid'].nil? ? '' : @data['puid']
  end
    
    
	# @return The responses to the prayer.
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
    