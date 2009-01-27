require File.dirname(__FILE__) + '/../spec_helper'

describe 'Helpful Matchers' do

  it 'response.should be_success' do
    request('/').should be_success
  end

  it 'response.should be_redirect'
  # request('/redirect?to=http://www.google.com').should be_redirect

  it 'response.should redirect_to(url)'
  #request('/redirect?to=http://www.google.com').should redirect_to('http://www.google.com')

  it 'response.should have_text("")'
  it 'response.should have_tag("")'
  it 'response.should have_tag(""){ with_tag("") }'

end
