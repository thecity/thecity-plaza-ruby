# ['/cachers/**/*.rb', '/loaders/**/.rb', '/plaza/**/*.rb'].each do |lib_path| 
#   Dir.glob(File.dirname(__FILE__) + lib_path).each { |lib_file| autoload lib_file }
# end


loaders_path = ONTHECITY_LIB_DIR + '/loaders/'
cache_path = ONTHECITY_LIB_DIR + '/cachers/'
cache_db_path = ONTHECITY_LIB_DIR  + '/cachers/db/'
cache_file_path = ONTHECITY_LIB_DIR + '/cachers/file/'
plaza_file_path = ONTHECITY_LIB_DIR + '/plaza/'

# require loaders_path + 'albums_loader.rb'
# require loaders_path + 'events_loader.rb'
# require loaders_path + 'needs_loader.rb'
# require loaders_path + 'prayers_loader.rb'
require loaders_path + 'topics_loader.rb'


require cache_path + 'cache_adapter.rb'
#require cache_db_path + 'mysql_cache.rb'
#require cache_db_path + 'postgres_cache.rb'
#require cache_db_path + 'redis_cache.rb'
require cache_file_path + 'json_cache.rb'

require plaza_file_path + 'plaza.rb'
require plaza_file_path + 'plaza_common.rb'
# require plaza_file_path + 'album.rb'
# require plaza_file_path + 'albums.rb'
# require plaza_file_path + 'event.rb'
# require plaza_file_path + 'events.rb'
# require plaza_file_path + 'need.rb'
# require plaza_file_path + 'needs.rb'
# require plaza_file_path + 'prayer.rb'
# require plaza_file_path + 'prayers.rb'
require plaza_file_path + 'topic.rb'
require plaza_file_path + 'topics.rb'