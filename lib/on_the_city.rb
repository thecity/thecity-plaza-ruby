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
require 'ruby-debug'

['/cachers/**/*.rb', '/loaders/**/.rb', '/plaza/**/*.rb'].each do |lib_path| 
  Dir.glob(File.dirname(__FILE__) + lib_path).each { |lib_file| require lib_file }
end


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

