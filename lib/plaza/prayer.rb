// <?php

//   /** 
//   * Project:    OnTheCity API 
//   * File:       prayer.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */


//   /** 
//    * A prayer instance.  This object is immutable.
//    *
//    * @package OnTheCity
//    */
//   class Prayer extends Plaza {

//     /**
//      * Constructor.
//      *
//      * @param array $data a Hash containing all the data to initialize this prayer.
//      */
//     public function __construct($data) {
//       parent::__construct($data);
//     }
    
    
//     /**
//      * @return The responses to the prayer.
//      */
//     public function posts() {
//       $rposts = array();
//       foreach ($this->data->prayer_responses as $prayer_response) { 
//         $name = 'Unknown';
//         if( !is_null($prayer_response->user) ) {
//           $name = $prayer_response->user->long_name;
//         } 
//         else if( !is_null($prayer_response->facebook_user) ) {
//           $name = $prayer_response->facebook_user->first.' '.$prayer_response->facebook_user->last;
//         }
        
//         $rposts[] = array(
//           'created_at' => $prayer_response->created_at,
//           'who_posted' => $name,
//           'content'    => $this->clean_text( $prayer_response->body )
//         );
//       }
       
//       return $rposts;
//     }
    
//   }
// ?>