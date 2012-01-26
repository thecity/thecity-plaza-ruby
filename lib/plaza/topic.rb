// <?php

//   /** 
//   * Project:    OnTheCity API 
//   * File:       topic.php
//    *
//    * @author Wes Hays <weshays@gbdev.com> 
//    * @link https://github.com/weshays/onthecity-api-php
//    * @version 1.0a
//    * @package OnTheCity
//    */


//   /** 
//    * A topic instance.  This object is immutable.
//    *
//    * @package OnTheCity
//    */
//   class Topic extends PlazaCommon {
    
//     /**
//      * Constructor.
//      *
//      * @param array $data a Hash containing all the data to initialize this topic.
//      */
//     public function __construct($data) {
//       parent::__construct($data);
//     }
    
    
//     /**
//      * @return The responses to the topic.
//      */
//     public function posts() {
//       $rposts = array();
//       foreach ($this->data->posts as $post) { 
//         $name = 'Unknown';
//         if( !is_null($post->user) ) {
//           $name = $post->user->long_name;
//         } 
//         else if( !is_null($post->facebook_user) ) {
//           $name = $post->facebook_user->first.' '.$post->facebook_user->last;
//         }
        
//         $rposts[] = array(
//           'created_at' => $post->created_at,
//           'who_posted' => $name,
//           'content'    => $this->clean_text( $post->body )
//         );
//       }
       
//       return $rposts;
//     }
    
//   }
// ?>