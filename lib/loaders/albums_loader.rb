// <?php

//   /** 
//   * Project:    OnTheCity API 
//   * File:       albums_loader.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */


//   /** 
//    * This class loads the Plaza needs for the subdomain.
//    *
//    * @package OnTheCity
//    */
//   class AlbumsLoader {

//     private $class_key = 'albums';
    
//     // The URL to load the albumns from.
//     private $url = '';
    
//     // The object to store and load the cache.
//     private $cacher;

//     /**
//      *  Constructor.
//      *
//      * @param string $subdomain The church subdomain.
//      * @param CacheInterface The cacher to be used to cache data.
//      */
//     public function __construct($subdomain, $cacher = null) {
//       $this->url = "http://$subdomain.onthecity.org/plaza/albums?format=json";      
//       if( !is_null($cacher) ) { $this->cacher = $cacher; }  
//     }
    
    
//     /**
//      *  Loads all the prayers on the Plaza for the subdomain.
//      *
//      * @return JSON The data loaded in a JSON object.
//      */  
//    public function load_feed() {      
//      if( !is_null($this->cacher) && !$this->cacher->is_cache_expired( $this->class_key ))  { 
//        return $this->cacher->get_data( $this->class_key ); 
//      }
       
//      $json = file_get_contents($this->url); 
//      $data = json_decode($json);    
        
//      $this->cache_data($data);       
     
//      return $data;
//    }  
   
   
//    /**
//     * @ignore
//     */
//    private function cache_data($data) {
//      if( !is_null($this->cacher) ) { 
//        $this->cacher->save_data($this->class_key, $data);
//      }
//    }
    
//   }
// ?>