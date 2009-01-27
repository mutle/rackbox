require File.dirname(__FILE__) + '/../spec_helper'

describe 'Helpful Matchers' do

  it 'response.should be_success' do
    request('/').should be_success
  end

  it 'response.should be_redirect' do
    request('/redirect?to=http://www.google.com').should be_redirect
  end

  it 'response.should redirect_to(url)' do
    #request('/redirect?to=http://www.google.com').should redirect_to('http://www.google.com')
    r = request('/redirect?to=http://www.google.com')
    r.should redirect_to('http://www.google.com')
  end

  it 'response.should have_text("")'
  it 'response.should have_tag("")'
  it 'response.should have_tag(""){ with_tag("") }'

end
