require File.dirname(__FILE__) + '/../spec_helper'

describe 'Home Page' do

  it 'should say something by itself' do
    req( '/' ).body.should include('You said nothing')
    request( '/' ).body.should include('You said nothing')
  end

  it 'should say whatever I tell it to' do
    request( '/', :method => :post, :params => { :say => 'hello' } ).body.should include('You said hello')
  end

end
