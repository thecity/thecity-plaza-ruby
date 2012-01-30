# Project::    OnTheCity API 
# File::       topic.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https:github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# A topic instance.  This object is immutable.
#
# @package OnTheCity
class Topic < PlazaCommon 
    
	# Constructor.
	#
	# @param array $data a Hash containing all the data to initialize this topic.
  def initialize(data) 
    super(data)
  end
    
    
	# @return The responses to the topic.
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
    