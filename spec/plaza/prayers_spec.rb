require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'OnTheCity::Plaza::Prayers' do

  it 'should create an instance successfully with valid arguments' do
    subdomain = 'livingstones'
    cacher = JsonCache.new(subdomain)
    loader = PrayersLoader.new(subdomain, cacher)
    prayers = Prayers.new(loader)
    prayers.all_titles.class.should == Array
  end
  
  it 'should raise an exception if the arguments are not valid' do
    lambda { Prayers.new('invalid_string_argument') }.should raise_error
  end
  
end