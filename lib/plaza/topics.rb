# Project::    OnTheCity API 
# File::       topics.rb
#
# Author:: Wes Hays <weshays@gbdev.com> 
# Link:: https://github.com/weshays/onthecity-api-ruby
# Version:: 1.0a
# Package:: OnTheCity


# This class is a wrapper for the topics page.
#
# @package OnTheCity
class Topics < Plaza 

  # Constructor.
  #
  # @param TopicsLoader loader The object that loaded the data.
  def initialize(loader) 
    super
    @json_data = loader.load_feed
  end
  
  
  # All the public topics on the Plaza.
  #
  # @return array of prayers.
  def all_titles
    @json_data.collect { |prayer| prayer[:global_topic][:title] }
  end
  
  
  # Get the specified topic.
  #
  # @param index The index of the topic to get all the information for.
  #
  # @return Topic
  def get_prayer(index)
    Prayer.new( @json_data[index][:global_topic] )
  end
  
end





# <?php

#   /** 
#   * Project:    OnTheCity API 
#   * File:       topics.php
#    *
#    * @author Wes Hays <weshays@gbdev.com> 
#    * @link https://github.com/weshays/onthecity-api-php
#    * @version 1.0a
#    * @package OnTheCity
#    */


#   /** 
#    * This class is a wrapper for the topics page.
#    *
#    * @package OnTheCity
#    */
#   class Topics extends Plaza {

#     // Holds the data
#     private $json_data = '';


#     /**
#      *  Constructor.
#      *
#      * @param TopicsLoader $loader The object that loaded the data.
#      */
#     public function __construct($loader) {
#       parent::__construct();
#       $this->json_data = $loader->load_feed();
#     }
    
    
#     /**
#      *  All the public topics on the Plaza.
#      *
#      *  @return array of topics
#      */
#     public function all_titles() {
#       $topics = array();
#       foreach ($this->json_data as $topic) { $topics[] = $topic->global_topic->title; }
#       return $topics;
#     }
    
    
#     /**
#      * Get the specified topic.
#      *
#      * @param index The index of the topic to get all the information for.
#      *
#      * @return Topic
#      */
#     public function get_topic($index) {
#       return new Topic( $this->json_data[$index]->global_topic );      
#     }
    
#   }
# ?>