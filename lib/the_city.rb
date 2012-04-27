# Project::    Plaza-Ruby 
# File::       the_city.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity

require 'rubygems'
require 'json'
require 'open-uri'


# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)
  
# The path to the storage directory that will be used for caching data to disk.
THECITY_STORAGE_DIR = File.dirname(__FILE__) + '/../storage/'


require File.dirname(__FILE__) + '/auto_load.rb'


# This class is meant to be a wrapper for the OnTheCity.org Plaza API.
#
# @package TheCity
class TheCity

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>cache_data</b> Cache the data. Default true.
  # <b>CacheAdapter cacher</b> The object that will store and load the cache. Default type JsonCache.
  #/
  def initialize(subdomain, cache_data = true, cacher = nil) 
    # The subdomain to load the data for.
    @subdomain = subdomain

    # The albums loaded for the subdomain.
    @albums = nil
    
    # The events loaded for the subdomain.
    @events = nil
    
    # The needs loaded for the subdomain. 
    @needs = nil
    
    # The prayers loaded for the subdomain.
    @prayers = nil
    
    # The topics loaded for the subdomain. 
    @topics = nil

    # The last number of albums requested.
    @albums_num_requested = 0
    
    # The last number of events requested.
    @events_num_requested = 0
    
    # The last number of needs requested.
    @needs_num_requested = 0
    
    # The last number of prayers requested.
    @prayers_num_requested = 0
    
    # The last number of topics requested.
    @topics_num_requested = 0

    
    # The object to store and load the cache.
    @cacher = nil
    
    if cache_data === true
      @cacher = cacher.nil? ? JsonCache.new(subdomain) : cacher
    end
  end



  # Shows all the topics posted on the Plaza.
  #
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  #
  # Returns array of all the topics posted on the Plaza.
  def topics(num_per_page = 10)
    return @topics if @topics_num_requested == num_per_page and !@topics.nil?  
    @topics_num_requested = num_per_page; 
    loader = TopicsLoader.new( @subdomain, num_per_page, @cacher )    
    @topics = Topics.new( loader );
    return @topics
  end


  # Shows all the needs posted on the Plaza.
  #
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  #
  # Returns array of all the needs posted on the Plaza.
  def needs(num_per_page = 10)
    return @needs if @needs_num_requested == num_per_page and !@needs.nil?  
    @needs_num_requested = num_per_page; 
    loader = NeedsLoader.new( @subdomain, num_per_page, @cacher )    
    @needs = Needs.new( loader );
    return @needs
  end


  # Shows all the prayers posted on the Plaza.
  #
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  #
  # Returns array of all the prayers posted on the Plaza.
  def prayers(num_per_page = 10)
    return @prayers if @prayers_num_requested == num_per_page and !@prayers.nil?   
    @prayers_num_requested = num_per_page; 
    loader = PrayersLoader.new( @subdomain, num_per_page, @cacher )    
    @prayers = Prayers.new( loader );
    return @prayers
  end


  # Shows all the events posted on the Plaza.
  #
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  #
  # Returns array of all the events posted on the Plaza.
  def events(num_per_page = 10)
    return @events if @events_num_requested == num_per_page and !@events.nil?
    @events_num_requested = num_per_page; 
    loader = EventsLoader.new( @subdomain, num_per_page, @cacher )    
    @events = Events.new( loader );
    return @events
  end


  # Shows all the albums posted on the Plaza.
  #
  # <b>num_per_page</b> The number of items to show.  Max is 15. Default is 10.
  #
  # Returns array of all the albums posted on the Plaza.
  def albums(num_per_page = 10)
    return @albums if @albums_num_requested == num_per_page and !@albums.nil?   
    @albums_num_requested = num_per_page; 
    loader = AlbumsLoader.new( @subdomain, num_per_page, @cacher )    
    @albums = Ablums.new( loader );
    return @albums
  end
  
end

