# Project::    OnTheCity API 
# File::       prayers.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the prayers page.
class Prayers

  # Constructor.
  #
  # <b>PrayersLoader loader</b> The object that loaded the data.
  def initialize(loader)
    @json_data = loader.load_feed
  end

  # Returns an array of all the prayers on the plaza
  def all
    @json_data.collect { |prayer| prayer[:global_prayer][:title] }
  end

end