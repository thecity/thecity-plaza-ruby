# Project::    OnTheCity API 
# File::       needs.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the needs page.
class Needs

  # Constructor.
  #
  # <b>NeedsLoader loader</b> The object that loaded the data.
  def initialize(loader)
    @json_data = loader.load_feed
  end

  # Returns an array of all the needs on the plaza
  def all
    @json_data.collect { |need| need[:global_need][:title] }
  end

end

# <?php

#   /** 
#   * Project:    OnTheCity API 
#   * File:       needs.php
#    *
#    * @author Wes Hays <weshays@gbdev.com> 
#    * @link https://github.com/weshays/onthecity-api-php
#    * @version 1.0a
#    * @package OnTheCity
#    */


#   /** 
#    * This class is a wrapper for the needs page.
#    *
#    * @package OnTheCity
#    */
#   class Needs extends Plaza  {

#     // Holds the data
#     private $json_data = '';


#     /**
#      *  Constructor.
#      *
#      * @param NeedsLoader $loader The object that loaded the data.
#      */
#     public function __construct($loader) {
#       parent::__construct();
#       $this->json_data = $loader->load_feed();
#     }
    
    
#     /**
#      *  All the public needs on the Plaza.
#      *
#      *  @return array of needs.
#      */
#     public function all_titles() {
#       $needs = array();
#       foreach ($this->json_data as $need) { $needs[] = $need->global_need->title; }
#       return $needs;
#     }
    
    
#     /**
#      * Get the specified need.
#      *
#      * @param index The index of the need to get all the information for.
#      *
#      * @return Need
#      */
#     public function get_need($index) {
#       return new Need( $this->json_data[$index]->global_need );
#     }
    
#   }
# ?>