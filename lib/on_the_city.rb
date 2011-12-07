# Project::    OnTheCity API 
# File::       on_the_city.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity

require 'rubygems'
require 'json'
require 'open-uri'


# This class is meant to be a wrapper for the OnTheCity.org API.
class OnTheCity

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>cache_data</b> Cache the data. Default true.
  # <b>CacheAdapter cacher</b> The object that will store and load the cache. Default type JsonCache.
  #/
  def initialize(subdomain, cache_data = true, cacher = nil) 
    # The subdomain to load the data for.
    @subdomain = subdomain

    # # The albums loaded for the subdomain.
    # @albums
    # 
    # # The events loaded for the subdomain.
    # @events
    # 
    # # The needs loaded for the subdomain. 
    # @needs
    # 
    # # The prayers loaded for the subdomain.
    # @prayers
    # 
    # # The topics loaded for the subdomain. 
    # @topics
    # 
    # # The object to store and load the cache.
    # @cacher
    
    if cache_data === true
      @cacher = cacher.nil? ? JsonCache.new(subdomain) : cacher
    end
  end



  # Shows all the topics posted on the Plaza.
  #
  # Returns array of all the topics posted on the Plaza.
  def topics
    return @topics unless @topics.nil?
    
    loader = TopicsLoader.new( @subdomain, @cacher )
    
    @topics = Topics.new( loader );
    return @topics
  end

end