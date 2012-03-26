# Project::    Plaza-Ruby 
# File::       need.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# A need instance.  This object is immutable.
#
# @package TheCity
class Need < PlazaCommon 
    
	# Constructor.
	#
	# @param array $data a Hash containing all the data to initialize this need.
  def initialize(data) 
    super(data)
  end
    

  # @return The ID of this need.
  #
  def id
    @data['nuid'].nil? ? '' : @data['nuid']
  end

    
	# @return The responses to the need.
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
    