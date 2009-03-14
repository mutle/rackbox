require 'rubygems'
require 'sinatra'
 
set :run,          false
set :environment,  :production
 
require 'sinatra_app'
use Rack::Session::Cookie
run Sinatra::Application
