require File.dirname(__FILE__) + '/../spec_helper'

describe 'Helpful Matchers' do

  before do
    puts "BEFORE ... redirect_to defined?  ... #{ (defined?(redirect_to)).inspect }"
  end

  #matcher(:redirect_to) do |a,b|
  #  puts "REDIRECT TO: #{a}, #{b}"
  #  true
  #end

  it 'response.should be_success' do
    request('/').should be_success
  end

  it 'response.should be_redirect'
  # request('/redirect?to=http://www.google.com').should be_redirect

  it 'response.should redirect_to(url)' do
    request('/redirect?to=http://www.google.com').should redirect_to('http://www.google.com')
  end

  it 'response.should have_text("")'
  it 'response.should have_tag("")'
  it 'response.should have_tag(""){ with_tag("") }'

end
