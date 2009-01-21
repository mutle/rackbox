# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'
require File.expand_path(File.dirname(__FILE__) + "/../../../lib/rackbox")

Spec::Runner.configure do |config|
  config.use_blackbox = true
end
