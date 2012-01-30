require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'OnTheCity::Plaza::Albums' do

  it 'should create an instance successfully with valid arguments' do
    subdomain = 'livingstones'
    cacher = JsonCache.new(subdomain)
    loader = AlbumsLoader.new(subdomain, cacher)
    albums = Albums.new(loader)
    albums.all_titles.class.should == Array
  end
  
  it 'should raise an exception if the arguments are not valid' do
    lambda { Albums.new('invalid_string_argument') }.should raise_error
  end
  
end