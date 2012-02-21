require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'TheCity::Plaza::Events' do

  it 'should create an instance successfully with valid arguments' do
    subdomain = 'livingstones'
    cacher = JsonCache.new(subdomain)
    loader = EventsLoader.new(subdomain, cacher)
    events = Events.new(loader)
    events.all_titles.class.should == Array
  end
  
  it 'should raise an exception if the arguments are not valid' do
    lambda { Events.new('invalid_string_argument') }.should raise_error
  end
  
end