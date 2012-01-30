# Project::    OnTheCity API 
# File::       postgresql_cache.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https:github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class caches the data in a postgresql database.
#
# @package OnTheCity
class PostgresCache < CacheAdapter 

  # Constructor.
  #
  # @param string $subdomain The church subdomain.
  def initialize(subdomain) 
    super
    @subdomain = subdomain
  end
  

	# Save data to the cache.
	#
	# @param string $key The key to use to save the cache.
	# @param string $data The JSON data to be saved.
	# @param string $expire_in The number of seconds to pass before expiring the cache.
	#
	# @return mixed Returns true on success or a string error message on false.	
	def save_data(key, data, expire_in = null)
	end


	# Get the data from the cache.
	#
	# @param string $key The key to use to get the cache.
	#
	# @return JSON data.
	def get_data(key) 
  end


	# Expire the cache.
	#
	# @param string $key The key to use to expire the cache.
	#
	# @throws Exception if unable to remove cache file.	
	def expire_cache!(key) 
	end


	# Check if the cache has expired.
	#
	# @param string $key The key to use to check if the cache has expired.
	#
	# @return boolean If the cache does not exist or is expired then true, otherwise false.
	def is_cache_expired?(key)
	end
  
end
