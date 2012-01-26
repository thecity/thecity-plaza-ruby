// <?php

//   /** 
//   * Project:    OnTheCity API 
//   * File:       json_cache.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */


//   /** 
//    * This class caches the data in a json
//    *
//    * @package OnTheCity
//    */
//   class JsonCache implements CacheInterface {
    
//     // The subdomain to load and store the data for.
//     private $subdomain;
    
//     // The subdomain directory path to save cache information
//     private $cache_dir;
    
//     /**
//      *  Constructor.
//      *
//      * @param string $subdomain The church subdomain.
//      * 
//      */
//     public function __construct($subdomain) {
//       $this->subdomain = $subdomain;
//       $this->cache_dir = ONTHECITY_STORAGE_DIR . $this->subdomain . '/';
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
//       if( is_null($expire_in) ) { $expire_in = 86400; } # 86400 seconds = 1 day
//       $expire_in += time();
      
//       $this->create_cache_directory_if_needed();
//       $this->expire_cache($key);
            
//       $filename = "$key-$expire_in-json.cache";
      
//       if (!$handle = fopen($this->cache_dir . $filename, 'w')) {
//         return "Cannot open file ($filename)";
//       }

//       if (fwrite($handle, serialize($data)) === FALSE) {
//         return "Cannot write to file ($filename)";
//       }

//       fclose($handle);

//       return true;
//     } 
    
    

//     /**
//      * Get the data from the cache.
//      *
//      * @param string $key The key to use to get the cache.
//      *
//      * @return JSON data.
//      */
//     public function get_data($key) {      
//       $filename = $this->find_file_key($key);
//       if( is_null($filename) ) { return null; }
//       $handle = fopen($this->cache_dir . $filename, 'r');
//       $contents = stream_get_contents($handle);
//       fclose($handle);
//       return unserialize($contents);
//     }
    
    
//     /**
//      * Expire the cache.
//      *
//      * @param string $key The key to use to expire the cache.
//      *
//      * @throws Exception if unable to remove cache file.
//      */
//     public function expire_cache($key) {
//       $file = $this->find_file_key($key);
//       if(!is_null($file) && !unlink($this->cache_dir .$file)) {
//         throw new Exception("Unable to remove cache file: $file");
//       }
//     }
    
    
//     /**
//      * Check if the cache has expired.
//      *
//      * @param string $key The key to use to check if the cache has expired.
//      *
//      * @return boolean If the cache does not exist or is expired then true, otherwise false.
//      */
//     public function is_cache_expired($key) {
//       $time_stamp_position = 1;
//       $fname = $this->find_file_key($key);
//       if( is_null($fname) ) { return true; }

//       $fname_a = explode('-', $fname);
//       if(time() > $fname_a[$time_stamp_position]) { return true; }
        
//       return false;
//     }
    
    
//     /**
//      * @ignore
//      */
//     private function create_cache_directory_if_needed() {
//       if(!file_exists($this->cache_dir )){
//         if(!mkdir($this->cache_dir)) {
//           throw new Exception('Failed to create cache directory');
//         }
//       }
//     }
    
    
//     /**
//      * @ignore
//      */
//     private function find_file_key($key) {      
//       if (file_exists($this->cache_dir) && $handle = opendir($this->cache_dir)) {
//         while (false !== ($file = readdir($handle))) {
//           $pos = stripos($file, "$key-");
//           if($pos !== false and $pos == 0) { 
//             closedir($handle);
//             return $file; 
//           }
//         }
//         closedir($handle);
//       }
      
//       return null;
//     }
    
    
//     /**
//      * @ignore
//      */
//     private function all_cache_files($key) {      
//       $cache_files = array();
//       if ($handle = opendir($this->cache_dir)) {
//         while (false !== ($file = readdir($handle))) {
//           if(stripos($file, '-json.cache') !== false) { $cache_files[] = $file; }
//         }
//         closedir($handle);
//       }
      
//       return $cache_files;
//     }
    
//   }
// ?>
