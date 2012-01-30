require "#{File.dirname(__FILE__)}/../spec_helper"

describe 'JsonCacher' do

  it 'should create a new instance if the subdomain is specified.' do
    jc = JsonCache.new('livingstones')
  end
  

  it 'should save the data and then retreive it successfully' do
  	subdomain = 'livingstones'
  	key = 'topics'
  	message = 'Hello World!!'

    jc1 = JsonCache.new(subdomain)
    jc2 = JsonCache.new(subdomain)

    jc1.save_data(key,message)
    jc2.get_data(key).should == message
  end


  it 'should expire the cache correctly' do
  	subdomain = 'livingstones'
  	key = 'topics'
  	message = 'Hello World!!'

    jc = JsonCache.new(subdomain)

    jc.save_data(key,message)

    jc.is_cache_expired?(key).should be_false
    jc.expire_cache!(key).should be_true
    jc.is_cache_expired?(key).should be_true
  end
  
end