// <?php

//   /** 
//    * Project:    OnTheCity API 
//    * File:       mysql_cache.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */


  

//   /** 
//    * This class caches the data in a mysql database.
//    *
//    * @package OnTheCity
//    */
//   class MySqlCache implements CacheInterface {
    
//     // The subdomain to load and store the data for.
//     private $subdomain;
    
    
//     /**
//      *  Constructor.
//      *
//      * @param string $subdomain The church subdomain.
//      * 
//      */
//     public function __construct($subdomain) {
//       $this->subdomain = $subdomain;
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
//     } 
    
    

//     /**
//      * Get the data from the cache.
//      *
//      * @param string $key The key to use to get the cache.
//      *
//      * @return JSON data.
//      */
//     public function get_data($key) {   
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
