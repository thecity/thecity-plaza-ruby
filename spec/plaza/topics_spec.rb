require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'OnTheCity::Plaza::Topics' do

  it 'should create an instance successfully with valid arguments' do
    subdomain = 'livingstones'
    cacher = JsonCache.new(subdomain)
    loader = TopicsLoader.new(subdomain, cacher)
    topics = Topics.new(loader)

    topics.all_titles

    dog = topics.get_topic(1)

    debugger
    asdf=234
  end
  
  # it 'should raise an exception if the arguments are not valid' do
  #   lambda { Topics.new('invalid_string_argument') }.should raise_error
  # end
  
end