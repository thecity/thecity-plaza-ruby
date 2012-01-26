// <?php

//   /** 
//   * Project:    OnTheCity API 
//   * File:       event.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */


//   /** 
//    * A event instance.  This object is immutable.
//    *
//    * @package OnTheCity
//    */
//   class Event extends PlazaCommon {
    
//     /**
//      * Constructor.
//      *
//      * @param array $data a Hash containing all the data to initialize this event.
//      */
//     public function __construct($data) {
//       parent::__construct($data);
//     }
    
    
//     /**
//      * @return The responses to the event.
//      */
//     public function posts() {
//       $rposts = array();
//       foreach ($this->data->event_responses as $event_response) { 
//         $name = 'Unknown';
//         if( !is_null($event_response->user) ) {
//           $name = $event_response->user->long_name;
//         } 
//         else if( !is_null($event_response->facebook_user) ) {
//           $name = $event_response->facebook_user->first.' '.$event_response->facebook_user->last;
//         }
        
//         $rposts[] = array(
//           'created_at'   => $event_response->created_at,
//           'who_posted'   => $name,
//           'attending'    => $event_response->attending,
//           'total_coming' => $event_response->total_coming
//         );
//       }
//       return $rposts;
//     }
    
//   }
// ?>