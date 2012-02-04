
# *******************************************
# This is a demo file to show usage.
#
# @package OnTheCity
# @author Wes Hays <weshays@gbdev.com>
# ******************************************* 

require File.dirname(__FILE__) + '/lib/on_the_city.rb'

on_the_city = OnTheCity.new('livingstones', false);

on_the_city.topics.all_titles.each { |t| puts t }

on_the_city.topics.get_topic(1)