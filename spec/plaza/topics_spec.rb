require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'OnTheCity::Plaza::Topics' do

  it 'should create an instance successfully with valid arguments'
  
  it 'should raise an exception if the arguments are not valid' do
    lambda { Topics.new('invalid_string_argument') }.should raise_error
  end
  
end