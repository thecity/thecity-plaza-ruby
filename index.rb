
# *******************************************
# This is a demo file to show usage.
#
# @package TheCity
# @author Wes Hays <wes@onthecity.org>
# ******************************************* 

require File.dirname(__FILE__) + '/lib/the_city.rb'


## Initalize

# First param is your church's subdomain key.
# Second param is whether or not to cache the data.
the_city = TheCity.new('livingstones', true);



## Load Topics
array_of_topic_titles = the_city.topics.titles

# by default will grab 10 topics.
topics = the_city.topics 

# Enumerable topics
topics.each { |t| t.title }
topics.collect { |t| t.title }


# limit the amount of topics fetched from The City.
topics = the_city.topics(3)    

# Get topic.
topic = topics.select(2)

# Get count.
topic = topics.size


## Load Events
array_of_event_titles = the_city.events.titles

# by default will grab 10 events.
events = the_city.events

# Enumerable events
events.each { |e| e.title }
events.collect { |e| e.title }

# limit the amount of events fetched from The City  
events = the_city.events(3)

# Get event.
event = events.select(2)

# Get count.
event = events.size


## Load Prayers
array_of_prayer_titles = the_city.prayers.titles

# by default will grab 10 prayers.
prayers = the_city.prayers

# Enumerable events
prayers.each { |p| p.title }
prayers.collect { |p| p.title }

# limit the amount of prayers fetched from The City  
prayers = the_city.prayers(3)

# Get prayer.
prayer = prayers.select(2)

# Get count.
prayer = prayers.size


## Load Needs
array_of_need_titles = the_city.prayers.titles

# by default will grab 10 needs.
needs = the_city.needs

# Enumerable events
needs.each { |n| n.title }
needs.collect { |n| n.title }

# limit the amount of needs fetched from The City   
needs = the_city.needs(3)

# Get need.
need = needs.select(2)

# Get count.
need = needs.size


## Albums
array_of_album_titles = the_city.albums.titles

# by default will grab 10 albums.
albums = the_city.albums

# Enumerable events
albums.each { |a| a.title }
albums.collect { |a| a.title }

# limit the amount of albums fetched from The City  
albums = the_city.albums(3)

# Get album.
album = albums.select(2)

# Get count.
album = albums.size


