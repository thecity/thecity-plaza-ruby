# Project::    OnTheCity API 
# File::       topics_loader.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class loads the Plaza topics for the subdomain.
class TopicsLoader 

  # Constructor.
  #
  # <b>subdomain</b> The church subdomain.
  # <b>CacheAdapter cacher</b> The cacher to be used to cache data.
  #/
  def initialize(subdomain, cacher = nil) 
    @class_key = 'topics'   
    
    # The URL to load the topics from. 
    @url = "http://#{subdomain}.onthecity.org/plaza/topics?format=json"
    
    # The object to store and load the cache.
    @cacher = cacher unless cacher.nil?    
  end


  # Loads all the topics on the Plaza for the subdomain.
  #
  # Returns the data loaded in a JSON object.
  def load_feed
    unless @cacher.nil? or @cacher.is_cache_expired( @class_key )
      return @cacher.get_data( @class_key )
    end   

    json = open(@url).read
    data = JSON.decode(json)    

    @cacher.save_data(@class_key, data) unless @cacher.nil?      

    return $data;
  end 

end



# <?php

#   /** 
#   * Project:    OnTheCity API 
#   * File:       topics_loader.php
#    *
#    * @author Wes Hays <weshays@gbdev.com> 
#    * @link https://github.com/weshays/onthecity-api-php
#    * @version 1.0a
#    * @package OnTheCity
#    */


#   /** 
#    * This class loads the Plaza topics for the subdomain.
#    *
#    * @package OnTheCity
#    */
#   class TopicsLoader {
    
#     private $class_key = 'topics';
    
#     // The URL to load the topics from.
#     private $url = '';
    
#     // The object to store and load the cache.
#     private $cacher;

#     /**
#      *  Constructor.
#      *
#      * @param string $subdomain The church subdomain.
#      * @param CacheInterface The cacher to be used to cache data.
#      */
#     public function __construct($subdomain, $cacher = null) {
#       $this->url = "http://$subdomain.onthecity.org/plaza/topics?format=json";        
#       if( !is_null($cacher) ) { $this->cacher = $cacher; }  
#     }
    
  
#     /**
#      *  Loads all the topics on the Plaza for the subdomain.
#      *
#      * @return JSON The data loaded in a JSON object.
#      */  
#     public function load_feed() {      
#       if( !is_null($this->cacher) && !$this->cacher->is_cache_expired( $this->class_key ))  { 
#         return $this->cacher->get_data( $this->class_key ); 
#       }
        
#       $json = file_get_contents($this->url); 
#       $data = json_decode($json);    
         
#       $this->cache_data($data);       
      
#       return $data;
#     }  
    
    
#     /**
#      * @ignore
#      */
#     private function cache_data($data) {
#       if( !is_null($this->cacher) ) { 
#         $this->cacher->save_data($this->class_key, $data);
#       }
#     }

#   }

# ?>