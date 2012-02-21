# Project::    Plaza-Ruby 
# File::       json_cache.rb
#
# Author:: Wes Hays <wes@onthecity.org> 
# Link:: https://github.com/thecity/plaza-ruby
# Version:: 0.1
# Package:: TheCity


# This class caches the data in a postgresql database.
#
# @package TheCity
class JsonCache < CacheAdapter 

  # Constructor.
  #
  # @param string $subdomain The church subdomain.
  def initialize(subdomain) 
    super
    @subdomain = subdomain
    @cache_dir = THECITY_STORAGE_DIR + subdomain + '/';
  end
  

	# Save data to the cache.
	#
	# @param string key The key to use to save the cache.
	# @param string data The JSON data to be saved.
	# @param string expire_in The number of seconds to pass before expiring the cache.
	#
	# @return mixed Returns true on success or a string error message on false.	
	def save_data(key, data, expire_in = nil)
		expire_in = 86400 if expire_in.nil?  # 86400 seconds = 1 day
		expire_in += Time.now.to_i

		create_cache_directory_if_needed
		expire_cache!(key)

		filename = "#{key}-#{expire_in}-json.cache"

    begin
      File.open(@cache_dir + filename, 'w') {|f| f.write( Marshal.dump(data) ) }
    rescue
    	return 'Unable to write to file'
    end

		return true		
	end


	# Get the data from the cache.
	#
	# @param string key The key to use to get the cache.
	#
	# @return JSON data.
	def get_data(key) 
	  filename = find_file_key(key)
		return nil if filename.nil?
		file = File.open(@cache_dir + filename, "rb")
    contents = file.read
		return Marshal.load(contents)
  end


	# Expire the cache.
	#
	# @param string key The key to use to expire the cache.
	#
	# @throws Exception if unable to remove cache file.	
	def expire_cache!(key) 
		file = find_file_key(key)
		unless file.nil? 
			begin
			  File.unlink(@cache_dir + file)
			rescue
		    raise new Exception("Unable to remove cache file: $file")
		  end
		end
	end


	# Check if the cache has expired.
	#
	# @param string key The key to use to check if the cache has expired.
	#
	# @return boolean If the cache does not exist or is expired then true, otherwise false.
	def is_cache_expired?(key)
	  time_stamp_position = 1;
		fname = find_file_key(key)
		return true if fname.nil?

		fname_a = fname.split('-')
	  if Time.now.to_i > fname_a[time_stamp_position].to_i
		  return true
		end

		return false;
	end


	private

	
	# @ignore
  def create_cache_directory_if_needed
    unless File.exist?( @cache_dir ) 
      unless FileUtils.mkdir_p( @cache_dir ) 
        raise new Exception('Failed to create cache directory')
      end
    end
  end
  
  
  # @ignore
	def find_file_key(key) 
	  if File.exist?(@cache_dir) 
      return Dir.entries( @cache_dir ).detect{ |f| f.include?("#{key}-") }
	  end
	  return nil
	end


	# @ignore
	def all_cache_files(key) 
    Dir.entries( @cache_dir ).select{ |f| f.include?("-json.cache") }
  end
  
end

  