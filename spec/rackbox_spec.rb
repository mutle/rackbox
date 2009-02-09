require File.dirname(__FILE__) + '/spec_helper'

describe RackBox do

  before do
    @rack_app = lambda {|env| [ 200, { }, "you requested path #{ env['PATH_INFO'] }" ] }  
  end

  it 'should be easy to run the #request method against any Rack app' do
    RackBox::App.new(@rack_app).request('/hello').body.should include('you requested path /hello')
  end

  it 'should be even easier to run the #request method against any Rack app' do
    RackBox.request(@rack_app, '/hello').body.should include('you requested path /hello')
  end

  it 'should make it easy to POST data, eg. curl -D "XML"'

end
