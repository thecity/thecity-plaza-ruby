require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'TheCity::Plaza::Needs' do

  it 'should create an instance successfully with valid arguments' do
    subdomain = 'livingstones'
    cacher = JsonCache.new(subdomain)
    loader = NeedsLoader.new(subdomain, cacher)
    needs = Needs.new(loader)
    needs.all_titles.class.should == Array
  end
  
  it 'should raise an exception if the arguments are not valid' do
    lambda { Needs.new('invalid_string_argument') }.should raise_error
  end
  
end