
# *******************************************
# This is a demo file to show usage.
#
# @package TheCity
# @author Wes Hays <wes@onthecity.org>
# ******************************************* 

require File.dirname(__FILE__) + '/lib/the_city.rb'

the_city = TheCity.new('livingstones', false);

#the_city.topics.all_titles.each { |t| puts t }


topic = the_city.topics.get_topic(1)

puts '--------------------------'
puts "Topic: #{topic.title}\n\n"
puts "Message: #{topic.content.strip}"