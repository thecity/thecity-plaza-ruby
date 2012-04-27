
# *******************************************
# This is a demo file to show usage.
#
# @package TheCity
# @author Wes Hays <wes@onthecity.org>
# ******************************************* 

require File.dirname(__FILE__) + '/lib/the_city.rb'

the_city = TheCity.new('livingstones');

#the_city.topics.all_titles.each { |t| puts t }
# topic = the_city.topics[1]
# puts '--------------------------'
# puts "Topic: #{topic.title}\n\n"
# puts "Message: #{topic.content.strip}"

# puts the_city.events.all_titles.inspect
# event = the_city.events[2]
# puts "Created at: " + event.created_at + "\n"
# puts "Starting at: " + event.starting_at + "\n"
# puts "Ending at: " + event.ending_at + "\n"
# puts "Who posted: " + event.who_posted + "\n"


needs = the_city.needs(2);  
puts needs.all_titles.inspect

needs = the_city.needs(5);  
puts needs.all_titles.inspect

topics = the_city.topics(5);  
puts topics.all_titles.inspect

topics = the_city.topics(7);  
puts topics.all_titles.inspect
