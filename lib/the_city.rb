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
    
    # The object to store and load the cache.
    @cacher = nil
    
    if cache_data === true
      @cacher = cacher.nil? ? JsonCache.new(subdomain) : cacher
    end
  end



  # Shows all the topics posted on the Plaza.
  #
  # Returns array of all the topics posted on the Plaza.
  def topics
    return @topics if @topics    
    loader = TopicsLoader.new( @subdomain, @cacher )    
    @topics = Topics.new( loader );
    return @topics
  end


  # Shows all the needs posted on the Plaza.
  #
  # Returns array of all the needs posted on the Plaza.
  def needs
    return @needs if @needs    
    loader = NeedsLoader.new( @subdomain, @cacher )    
    @needs = Needs.new( loader );
    return @needs
  end


  # Shows all the prayers posted on the Plaza.
  #
  # Returns array of all the prayers posted on the Plaza.
  def prayers
    return @prayers if @prayers    
    loader = PrayersLoader.new( @subdomain, @cacher )    
    @prayers = Prayers.new( loader );
    return @prayers
  end


  # Shows all the events posted on the Plaza.
  #
  # Returns array of all the events posted on the Plaza.
  def events
    return @events if @events    
    loader = EventsLoader.new( @subdomain, @cacher )    
    @events = Events.new( loader );
    return @events
  end
  
end

