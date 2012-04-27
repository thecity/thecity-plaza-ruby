
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

# limit the amount of topics fetched from The City.
topics = the_city.topics(3)    


## Load Events
array_of_event_titles = the_city.events.titles

# by default will grab 10 events.
events = the_city.events

# limit the amount of events fetched from The City  
events = the_city.events(3)


## Load Prayers
array_of_prayer_titles = the_city.prayers.titles

# by default will grab 10 prayers.
prayers = the_city.prayers

# limit the amount of prayers fetched from The City  
prayers = the_city.prayers(3)


## Load Needs
array_of_need_titles = the_city.prayers.titles

# by default will grab 10 needs.
needs = the_city.needs

# limit the amount of needs fetched from The City   
needs = the_city.needs(3)


## Albums
array_of_album_titles = the_city.albums.titles

# by default will grab 10 albums.
albums = the_city.albums

# limit the amount of albums fetched from The City  
albums = the_city.albums(3)


