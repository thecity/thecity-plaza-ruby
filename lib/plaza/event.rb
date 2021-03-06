# Project::    Plaza-Ruby 
# File::       event.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/thecity-plaza-ruby
# Package:: TheCity


# A topic instance.  This object is immutable.
#
# @package TheCity
class Event < PlazaCommon 
    
	# Constructor.
	#
	# @param array $data a Hash containing all the data to initialize this topic.
  def initialize(data) 
    super(data)
  end
    

  # @return The ID of this event.
  #
  def id
    @data['euid'].nil? ? '' : @data['euid']
  end


  # @return When this event starts.
  #
  def starting_at
    @data['starting_at']
  end


  # @return When this event ends.
  #
  def ending_at
    @data['ending_at']
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
	               :attending  => post['attending'],
	               :total_coming => post['total_coming'] }
    end	               
   	rposts
	end

end