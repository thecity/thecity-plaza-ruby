// <?php

//   /** 
//    * Project:    OnTheCity API 
//    * File:       json_cache.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */

//   /**
//    * Uses the predis library to access Redis.
//    */
//   require_once( ONTHECITY_LIB_DIR . '/../etc/predis/autoload.php');
  

//   /** 
//    * This class caches the data in a json
//    *
//    * @package OnTheCity
//    */
//   class RedisCache implements CacheInterface {
    
//     // The subdomain to load and store the data for.
//     private $subdomain;
    
//     // The redis instance to save cache information
//     private $redis;
    
//     /**
//      *  Constructor.
//      *
//      * @param string $subdomain The church subdomain.
//      * 
//      */
//     public function __construct($subdomain) {
//       $this->subdomain = $subdomain;
      
//       Predis\Autoloader::register();
//       $this->redis = new Predis\Client();
//     }
    
    
//     /**
//      *  Save data to the cache.
//      *
//      * @param string $key The key to use to save the cache.
//      * @param string $data The JSON data to be saved.
//      * @param string $expire_in The number of seconds to pass before expiring the cache.
//      *
//      * @return mixed Returns true on success or a string error message on false.
//      */
//     public function save_data($key, $data, $expire_in = null) {
//       $this->redis->set($key, $data);
//     } 
    
    

//     /**
//      * Get the data from the cache.
//      *
//      * @param string $key The key to use to get the cache.
//      *
//      * @return JSON data.
//      */
//     public function get_data($key) {   
//       $this->redis->get($key);
//     }
    
    
//     /**
//      * Expire the cache.
//      *
//      * @param string $key The key to use to expire the cache.
//      *
//      * @throws Exception if unable to remove cache file.
//      */
//     public function expire_cache($key) {
//     }
    
    
//     /**
//      * Check if the cache has expired.
//      *
//      * @param string $key The key to use to check if the cache has expired.
//      *
//      * @return boolean If the cache does not exist or is expired then true, otherwise false.
//      */
//     public function is_cache_expired($key) {
//     }
    

    
//   }
// ?>
